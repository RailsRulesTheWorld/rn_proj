//
//  TileView.swift
//  rn_proj
//
//  Created by Austin Zheng on 6/3/14.
//  Copyright (c) 2014 Austin Zheng. Released under the terms of the MIT license.
//

import UIKit

/// A view representing a single rn_proj tile.
class TileView : UIView {
  var value : Int = 0 {
    didSet {
      backgroundColor = delegate.tileColor(value)
      numberLabel.textColor = delegate.numberColor(value)
      numberLabel.text = "\(value)"
    }
  }

  unowned let delegate : AppearanceProviderProtocol
  let numberLabel : UILabel

  required init(coder: NSCoder) {
    fatalError("NSCoding not supported")
  }

  init(position: CGPoint, width: CGFloat, value: Int, radius: CGFloat, delegate d: AppearanceProviderProtocol) {
    delegate = d
    numberLabel = UILabel(frame: CGRectMake(0, 0, width, width))
    numberLabel.textAlignment = NSTextAlignment.Center
    numberLabel.minimumScaleFactor = 0.5
    numberLabel.font = delegate.fontForNumbers()

    super.init(frame: CGRectMake(position.x, position.y, width, width))
    addSubview(numberLabel)
    layer.cornerRadius = radius

    self.value = value
    backgroundColor = delegate.tileColor(value)
    numberLabel.textColor = delegate.numberColor(value)
    numberLabel.text = "\(value)"
  }
}
