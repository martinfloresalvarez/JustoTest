//
//  RootViewController.swift
//  JustoTest
//
//  Created by Martin Flores Alvarez on 30/09/22.
//

import Foundation
import UIKit

class RootView: UINavigationController {

  override func viewDidLoad() {
    let userViewController = UserTableView()
    let navigationController = self
    navigationController.setViewControllers([userViewController], animated: false)
  }
  
}
