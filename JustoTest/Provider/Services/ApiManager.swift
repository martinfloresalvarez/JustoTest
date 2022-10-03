//
//  ApiManager.swift
//  JustoTest
//
//  Created by Martin Flores Alvarez on 30/09/22.
//

import Foundation

class ApiManager {
  public static let shared = ApiManager()
  
  func getDataUser(parameters: [String: Any], success: @escaping ((User) -> Void), fail: @escaping (() -> Void)) {
    ServiceManager.shared.callService(urlString: Constants.urlApi, parameters: parameters) { (response: User) in success(response)
    } fail: {
      fail()
    }
  }
  
  func getDataUsers(parameters: [String: Any], success: @escaping ((Users) -> Void), fail: @escaping (() -> Void)) {
    ServiceManager.shared.callService(urlString: "https://randomuser.me/api/?results=\(parameters["elements"] ?? "10")&inc=name,picture", parameters: parameters) { (response: Users) in success(response)
    } fail: {
      fail()
    }
  }
}
