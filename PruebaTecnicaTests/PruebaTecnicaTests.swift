//
//  PruebaTecnicaTests.swift
//  PruebaTecnicaTests
//
//  Created by Jose Antonio Aravena on 25-03-20.
//  Copyright © 2020 Jose Antonio Aravena. All rights reserved.
//

import XCTest
import RxTest
import RxBlocking
import RxSwift
@testable import PruebaTecnica

class PruebaTecnicaTests: XCTestCase {

    var movie: Movie!
    override func setUp() {
        movie = Movie(idMovie: 1, title: "la peste", year: "2020",
                      overview: "un virus de china...", idGenre: [0], url: "_2020")
    }

    override func tearDown() {
    }

    func test1() {
        XCTAssertEqual(movie.getYear(), "2020")
    }

    func test2() {
        XCTAssertEqual(movie.getImage(), "https://image.tmdb.org/t/p/w600_and_h900_bestv2_2020")
    }
    

}
