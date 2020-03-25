//
//  Genres.swift
//  PruebaTecnica
//
//  Created by Jose Antonio Aravena on 25-03-20.
//  Copyright © 2020 Jose Antonio Aravena. All rights reserved.
//

import Foundation

struct Genres: Decodable {
    var list: [Genre] = Array()

    enum CodingKeys: String, CodingKey {
        case list = "genres"
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(list, forKey: "genres")
    }
}
