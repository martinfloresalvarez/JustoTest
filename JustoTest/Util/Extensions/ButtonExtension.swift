//
//  ButtonExtension.swift
//  JustoTest
//
//  Created by Martin Flores Alvarez on 02/10/22.
//

import UIKit

extension UIButton {
  
  class func nanigationBarButton() -> UIButton {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(systemName: "list.dash"), for: .normal)
    button.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
    button.tintColor = UIColor.titleColor
    return button
  }
  
}
