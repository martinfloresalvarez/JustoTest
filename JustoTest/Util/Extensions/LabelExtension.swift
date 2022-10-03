//
//  LabelExtension.swift
//  JustoTest
//
//  Created by Martin Flores Alvarez on 02/10/22.
//

import UIKit

class InfoLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    self.textAlignment = .left
    self.numberOfLines = 0
    self.font = UIFont.mainFont
    self.textColor = UIColor.mainTextColor
  }
}

class UserLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    self.textAlignment = .left
    self.numberOfLines = 0
    self.font = UIFont.titleFont
    self.textColor = UIColor.titleColor
  }
}
