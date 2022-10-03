//
//  Util.swift
//  JustoTest
//
//  Created by Martin Flores Alvarez on 02/10/22.
//

import UIKit

func version() -> String {
  if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
     let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
    return "\(version)(\(build))"
  }
  return ""
}

func langApp() -> String {
  return Locale.current.languageCode ?? "en"
}

func hexStringToUIColor (hex: String) -> UIColor {
  var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
  
  if cString.hasPrefix("#") {
    cString.remove(at: cString.startIndex)
  }
  
  if (cString.count) != 6 {
    return UIColor.gray
  }
  
  var rgbValue: UInt64 = 0
  Scanner(string: cString).scanHexInt64(&rgbValue)
  
  return UIColor(
    red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
    green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
    blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
    alpha: CGFloat(1.0)
  )
}

extension String {
  var isValidURL: Bool {
    do {
      let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
      if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
        return match.range.length == self.utf16.count
      } else {
        return false
      }
    } catch let error as NSError {
      return false
    }
  }
}
