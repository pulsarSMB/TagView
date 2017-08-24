//
//  TagView.swift
//  TagView
//
//  Created by pulsar on 12.08.17.
//  Copyright © 2017 pulsar. All rights reserved.
//

import UIKit


@IBDesignable
class TagView: UIView {

  var buttonBackgroundColor = #colorLiteral(red: 0.476567328, green: 0.3525734544, blue: 0.601198256, alpha: 1)
  var buttonTintColor = UIColor.white
  var titleFont = UIFont.systemFont(ofSize: 14)
  var top: CGFloat = 0.0
  var leading: CGFloat = 0.0
  var trailing: CGFloat = 0.0
  var buttom: CGFloat = 0.0
  var ySpacing: CGFloat = 5.0
  var xSpacing: CGFloat = 8.0
  private lazy var heighConstraint: NSLayoutConstraint = {
    let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
    constraint.isActive = true
    return constraint }()
  private var tagButtons = [UIButton]() {
    didSet {
      _ = oldValue.map { $0.removeFromSuperview() }
    }
  }
  
  
  func createCloudTagsWithTitles(_ titles: [String], target: Any? = nil, action: Selector? = nil) {
    tagButtons = titles.map { createButtonWithTitle($0, target: target, action: action) }
  }
  
  private func createButtonWithTitle(_ title: String, target: Any?, action: Selector?) -> UIButton {
    let button = UIButton(type: .system)
    addSubview(button)
    button.setTitle(title, for: .normal)
    button.titleLabel?.font = titleFont
    button.sizeToFit()
    button.frame.size.height = (button.titleLabel?.font.pointSize)! + 5
    let radius = button.frame.height * 0.5
    button.layer.masksToBounds = true
    button.layer.cornerRadius = radius
    button.frame.size.width += radius
    button.backgroundColor = buttonBackgroundColor
    button.tintColor = buttonTintColor
    if let action = action {
      button.addTarget(target, action: action, for: .touchUpInside)
    }
    return button
  }

  // MARK: - Layout tabButtons

  override func layoutSubviews() {
    super.layoutSubviews()
    arrangeTagButton()
  }
  
  private func arrangeTagButton() {
    let maxViewWidth = self.frame.width
    var xOffset: CGFloat = leading
    var yOffset: CGFloat = top
    var heightTagButton: CGFloat = 0
    for tagButton in tagButtons {
      heightTagButton = tagButton.frame.height
      let widthTagButton = tagButton.frame.width
      if (xOffset + widthTagButton + trailing) > maxViewWidth {
        xOffset = leading
        yOffset += heightTagButton + ySpacing
      }
      tagButton.frame.origin.x = xOffset
      tagButton.frame.origin.y = yOffset
      xOffset += widthTagButton + xSpacing
    }
    heighConstraint.constant = yOffset + heightTagButton + buttom
  }

  // MARK: - Interface Builder

  override func prepareForInterfaceBuilder() {
    createCloudTagsWithTitles(["Welcome","to","TagView"])
  }

  
}
