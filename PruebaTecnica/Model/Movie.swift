//
//  Movie.swift
//  PruebaTecnica
//
//  Created by Jose Antonio Aravena on 25-03-20.
//  Copyright © 2020 Jose Antonio Aravena. All rights reserved.
//

import Foundation

class Movie: NSObject, NSCoding, Decodable {
    var idMovie: Int
    private var year: String
    var title: String
    var overview: String
    var idGenre: [Int]

    private var urlImagen: String

    override convenience init() {
        self.init(idMovie: 0, title: "", year: "", overview: "", idGenre: [0], url: "")
    }

    init(idMovie: Int, title: String, year: String, overview: String, idGenre: [Int], url: String) {
        self.idMovie = idMovie
        self.title = title
        self.year = year
        self.overview = overview
        self.idGenre = idGenre
        self.urlImagen = url
    }

    required convenience init(coder aDecoder: NSCoder) {
        let idMovie = aDecoder.decodeInteger(forKey: "id")
        // swiftlint:disable force_cast
        let title = aDecoder.decodeObject(forKey: "title") as! String
        let year = aDecoder.decodeObject(forKey: "year") as! String
        let overview = aDecoder.decodeObject(forKey: "overview") as! String
        let idGenre = aDecoder.decodeObject(forKey: "idGenre") as! [Int]
        let url = aDecoder.decodeObject(forKey: "url") as! String
        // swiftlint:enable force_cast
        self.init(idMovie: idMovie, title: title, year: year, overview: overview, idGenre: idGenre,
                url: url)
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(idMovie, forKey: "id")
        aCoder.encode(title, forKey: "title")
        aCoder.encode(year, forKey: "year")
        aCoder.encode(overview, forKey: "overview")
        aCoder.encode(idGenre, forKey: "idGenre")
        aCoder.encode(urlImagen, forKey: "url")
    }

    func getImage() -> String {
        return Constants.preImagen + self.urlImagen
    }
    func getYear() -> String {
        return String(self.year.split(separator: "-")[0])
    }
    enum CodingKeys: String, CodingKey {
        case idMovie = "id"
        case year = "release_date"
        case title
        case overview
        case idGenre = "genre_ids"
        case urlImagen = "poster_path"
    }
    override func isEqual(_ object: Any?) -> Bool {
        return (object as? Movie)?.idMovie == self.idMovie
    }
}
