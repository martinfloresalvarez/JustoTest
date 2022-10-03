//
//  Users.swift
//  JustoTest
//
//  Created by Martin Flores Alvarez on 02/10/22.
//

import Foundation

struct Users: Codable {
  var results: [ResultsUsers]
}
struct ResultsUsers: Codable {
  let name: Name
  let picture: Picture
}
