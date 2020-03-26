//
//  InfoViewModel.swift
//  PruebaTecnica
//
//  Created by Jose Antonio Aravena on 25-03-20.
//  Copyright © 2020 Jose Antonio Aravena. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class InfoViewModel {
    let disposeBag = DisposeBag()
    public let movie: PublishSubject<Movie> = PublishSubject()
    private let disposable = DisposeBag()

    public func getData(movie: Movie, completion: @escaping (String) -> Void) {
        getGenero(movie: movie, completion: { name in
            print(name)
            completion(name)
        })
    }
}
