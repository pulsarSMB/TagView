//
//  TagView.swift
//  TagView
//
//  Created by pulsar on 12.08.17.
//  Copyright © 2017 pulsar. All rights reserved.
//

import UIKit

@IBDesignable
public class TagView: UIView {
  public var top: CGFloat = 0.0
  public var leading: CGFloat = 0.0
  public var trailing: CGFloat = 0.0
  public var buttom: CGFloat = 0.0
  public var ySpacing: CGFloat = 5.0
  public var xSpacing: CGFloat = 8.0
  public var tagStyles: [ButtonStyles] = [.select, .deselect]
  public var selectedTagTitles: [String] {
    return tagButtons
      .filter { $0.style! == tagStyles[0] }
      .map { $0.titleLabel?.text ?? "No title" }
  }
  private var editTagButton: (TagButton?, top: Bool) = (nil, false)
  private lazy var heighConstraint: NSLayoutConstraint = {
    let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
    constraint.isActive = true
    return constraint }()
  private var tagButtons = [TagButton]() {
    didSet { _ = oldValue.map { $0.removeFromSuperview() } }
  }
  
  @objc private func actionSelectTag(_ sender: TagButton) {
    sender.style = sender.style == tagStyles[0] ? tagStyles[1] : tagStyles[0]
  }
  
  
  private func createButtonWithTitle(_ title: String, style: ButtonStyles, target: Any?, action: Selector?) -> TagButton {
    let button = TagButton(title: title, style: style)
    addSubview(button)
    if let action = action {
      button.addTarget(target, action: action, for: .touchUpInside)
    }
    return button
  }
  
  public func createCloudTagsWithTitles(_ titles: [String], target: Any? = nil, action: Selector? = nil) {
    tagButtons = titles.map { createButtonWithTitle($0, style: .select, target: target, action: action) }
  }
  
  public func createCloudTagsWithTitles(_ titles: [(String, Bool)]) {
    tagButtons = titles.map { createButtonWithTitle($0.0,
                                                    style: $0.1 ? tagStyles[0] : tagStyles[1],
                                                    target: self, action: #selector(actionSelectTag)) }
  }
  
  public func addEditButton(title: String, style: ButtonStyles = .action, top: Bool = false, target: Any?, action: Selector?) {
    editTagButton = (createButtonWithTitle(title, style: style, target: target, action: action), top)
  }
  
  // MARK: - Layout tabButtons
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    arrangeTagButton()
  }
  
  private func arrangeTagButton() {
    let maxViewWidth = self.frame.width
    var xOffset: CGFloat = leading
    var yOffset: CGFloat = top
    var heightTagButton: CGFloat = 0
    if let button = editTagButton.0, editTagButton.top {
      layoutButton(button, maxViewWidth, &heightTagButton, &xOffset, &yOffset)
    }
    _ = tagButtons.map { layoutButton($0, maxViewWidth, &heightTagButton, &xOffset, &yOffset) }
    if let button = editTagButton.0, !editTagButton.top {
      layoutButton(button, maxViewWidth, &heightTagButton, &xOffset, &yOffset)
    }
    heighConstraint.constant = yOffset + heightTagButton + buttom
  }
  
  private func layoutButton(_ button: TagButton, _ maxViewWidth: CGFloat, _ heightTagButton: inout CGFloat, _ xOffset: inout CGFloat, _ yOffset: inout CGFloat) {
    heightTagButton = button.frame.height
    let widthTagButton = button.frame.width
    if (xOffset + widthTagButton + trailing) > maxViewWidth {
      xOffset = leading
      yOffset += heightTagButton + ySpacing
    }
    button.frame.origin.x = xOffset
    button.frame.origin.y = yOffset
    xOffset += widthTagButton + xSpacing
  }
  
  
}


// MARK: - Interface Builder
extension TagView {
  public override func prepareForInterfaceBuilder() {
    createCloudTagsWithTitles([("Welcome",false), ("to",false), ("TagView",true)])
  }
  
  
}
