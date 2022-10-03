//
//  Moviesl.swift
//  JustoTest
//
//  Created by Martin Flores Alvarez on 02/10/22.
//

import Foundation

struct User: Codable {
  let results: [Results]
}

struct Results: Codable {
  let gender: String
  let name: Name
  let location: Location
  let email: String
  let login: Login
  let dob: Dob
  let registered: Registered
  let phone: String
  let cell: String
  let id: Id
  let picture: Picture
  let nat: String
  
}

struct Name: Codable {
  let title: String
  let first: String
  let last: String
}

struct Location: Codable {
  let street: Street
  let city: String
  let state: String
  let country: String
  let postcode: String
  let coordinates: Coordinates
  let timezone: Timezone
  
  enum CodingKeys: String, CodingKey {
    case street, city, state, country, postcode, coordinates, timezone
  }
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    street = try values.decode(Street.self, forKey: .street)
    city = try values.decode(String.self, forKey: .city)
    state = try values.decode(String.self, forKey: .state)
    country = try values.decode(String.self, forKey: .country)
    coordinates = try values.decode(Coordinates.self, forKey: .coordinates)
    timezone = try values.decode(Timezone.self, forKey: .timezone)
    
    do {
      postcode = try String(values.decode(Int.self, forKey: .postcode))
    } catch DecodingError.typeMismatch {
      postcode = try values.decode(String.self, forKey: .postcode)
    }
  }
}

struct Street: Codable {
  let number: Int
  let name: String
}

struct Coordinates: Codable {
  let latitude: String
  let longitude: String
}

struct Timezone: Codable {
  let offset: String
  let description: String
}

struct Login: Codable {
  let uuid: String
  let username: String
  let password: String
  let salt: String
  let md5: String
  let sha1: String
  let sha256: String
}

struct Dob: Codable {
  let date: String
  let age: Int
}

struct Registered: Codable {
  let date: String
  let age: Int
}

struct Id: Codable {
  let name: String?
  let value: String?
}

struct Picture: Codable {
  let large: String
  let medium: String
  let thumbnail: String
}

struct Info: Codable {
  let seed: Int
  let results: Int
  let page: Int
  let version: Int
  
}
