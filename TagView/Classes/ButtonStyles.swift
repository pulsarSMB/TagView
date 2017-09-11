//
//  ButtonStyles.swift
//  TagViewDemo
//
//  Created by pulsar on 08.09.17.
//  Copyright © 2017 pulsar. All rights reserved.
//

import UIKit

/// Example extension styles:
///  ````
///  extension ButtonStyles {
///    static var styleName: ButtonStyles {
///      return ButtonStyles( ... )
///    }
///  }
///  ````
public struct ButtonStyles {
  var backgroundColor: UIColor = #colorLiteral(red: 0.476567328, green: 0.3525734544, blue: 0.601198256, alpha: 1)
  var tintColor: UIColor = UIColor.white
  var titleFont: UIFont = UIFont.systemFont(ofSize: 14)
  var percentCornerRadius: CGFloat = 1
  var margin: CGFloat = 5
  
  public static let select = ButtonStyles()
  public static let deselect = ButtonStyles(backgroundColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
  public static let action = ButtonStyles(backgroundColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
  
  public init(backgroundColor: UIColor, tintColor: UIColor, titleFont: UIFont, percentCornerRadius: CGFloat, margin: CGFloat) {
    self.init(backgroundColor: backgroundColor, tintColor: tintColor)
    self.titleFont = titleFont
    self.percentCornerRadius = percentCornerRadius
    self.margin = margin
  }
  
  public init(backgroundColor: UIColor, tintColor: UIColor) {
    self.init(backgroundColor: backgroundColor)
    self.tintColor = tintColor
  }
  
  public init(backgroundColor: UIColor) {
    self.backgroundColor = backgroundColor
  }
  
  public init() {}
  
  
}

//MARK: Equatable
extension ButtonStyles: Equatable {
  public static func ==(lhs: ButtonStyles, rhs: ButtonStyles) -> Bool {
    return lhs.hashValue == rhs.hashValue
  }
  
}

//MARK: Hashable
extension ButtonStyles: Hashable {
  public var hashValue: Int {
    return backgroundColor.hashValue ^ tintColor.hashValue ^ titleFont.hashValue ^ percentCornerRadius.hashValue ^ margin.hashValue
  }
  
}
