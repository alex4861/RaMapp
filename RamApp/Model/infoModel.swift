//
//  infoModel.swift
//  RamApp
//
//  Created by José Alejandro Bravo Cedillo on 12/24/19.
//  Copyright © 2019 José Alejandro Bravo Cedillo. All rights reserved.
//

import Foundation
struct infoModel: Codable { // or Decodable
    let count: Int
    let next: String?
    let pages: Int
    let prev: String?
}
