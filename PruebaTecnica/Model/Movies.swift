//
//  Movies.swift
//  PruebaTecnica
//
//  Created by Jose Antonio Aravena on 25-03-20.
//  Copyright © 2020 Jose Antonio Aravena. All rights reserved.
//

import Foundation

struct Movies: Decodable {
    private var list: [Movie] = Array()
    var total = 0
    var totalPages = 0
    var page = 0

    func getList() -> [Movie] {
        return self.list
    }

    enum CodingKeys: String, CodingKey {
        case list = "results"
        case total = "total_results"
        case totalPages = "total_pages"
        case page
    }
    func print() {
        Swift.print("total \(total)")
        Swift.print("totalPages \(totalPages)")
        Swift.print("page \(page)")
        for movie in list {
            Swift.print(movie.title)
        }
    }
}
