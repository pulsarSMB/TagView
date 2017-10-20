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
    didSet { setStyle(style) }
  }
  
  convenience init(title: String, style: ButtonStyles) {
    self.init(type: .system)
    self.setTitle(title, for: .normal)
    self.setStyle(style)
  }
  
  private func setStyle(_ style: ButtonStyles?) {
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
