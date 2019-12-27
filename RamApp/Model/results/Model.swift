//
//  Model.swift
//  RamApp
//
//  Created by José Alejandro Bravo Cedillo on 12/24/19.
//  Copyright © 2019 José Alejandro Bravo Cedillo. All rights reserved.
//

import Foundation

struct Model: Codable { // or Decodable
    let gender: String
    let id: Int
    let image: URL
    let location: LocationModel
    let name: String
    let origin: OriginModel
    let species: String
    let status: String
}
