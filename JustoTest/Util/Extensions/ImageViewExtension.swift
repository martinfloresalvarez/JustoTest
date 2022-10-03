//
//  ImageViewExtension.swift
//  JustoTest
//
//  Created by Martin Flores Alvarez on 02/10/22.
//

import UIKit

class UserImageView: UIImageView {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.contentMode = .scaleAspectFill
    self.layer.cornerRadius = self.frame.size.height / 2
    self.clipsToBounds = true
  }
}
