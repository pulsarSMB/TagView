//
//  TagButton.swift
//  TagViewDemo
//
//  Created by pulsar on 08.09.17.
//  Copyright © 2017 pulsar. All rights reserved.
//

import UIKit

public class TagButton: UIButton {

  var style: ButtonStyles? {
    didSet { setStyle() }
  }
  
  public class func `init`(title: String, style: ButtonStyles) -> TagButton {
    let tabButton = TagButton(type: .system)
    tabButton.setTitle(title, for: .normal)
    tabButton.style = style
    return tabButton
  }
  
  public override func setTitle(_ title: String?, for state: UIControlState) {
    super.setTitle(title, for: state)
    setStyle()
  }
  
  private func setStyle() {
    guard let style = style else { return }
    self.backgroundColor = style.backgroundColor
    self.tintColor = style.tintColor
    self.titleLabel?.font = style.titleFont
    self.sizeToFit()
    self.frame.size.height = (self.titleLabel?.font.pointSize)! + style.margin
    let radius = self.frame.height * 0.5 * style.percentCornerRadius
    self.layer.masksToBounds = true
    self.layer.cornerRadius = radius
    self.frame.size.width += radius + style.margin
  }

  
}
