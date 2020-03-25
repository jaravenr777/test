//
//  Genre.swift
//  PruebaTecnica
//
//  Created by Jose Antonio Aravena on 25-03-20.
//  Copyright © 2020 Jose Antonio Aravena. All rights reserved.
//

import Foundation

struct Genre: Decodable {
    var idGenre = 0
    var name = ""

    enum CodingKeys: String, CodingKey {
        case idGenre = "id"
        case name
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(idGenre, forKey: "id")
        aCoder.encode(name, forKey: "name")
    }
}
