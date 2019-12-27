//
//  ResponseModel.swift
//  RamApp
//
//  Created by José Alejandro Bravo Cedillo on 12/24/19.
//  Copyright © 2019 José Alejandro Bravo Cedillo. All rights reserved.
//

import Foundation

struct ResponseModel: Codable { // or Decodable
    let info: infoModel
    let results: [Model]
}
