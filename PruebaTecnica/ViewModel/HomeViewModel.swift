//
//  HomeViewModel.swift
//  PruebaTecnica
//
//  Created by Jose Antonio Aravena on 25-03-20.
//  Copyright © 2020 Jose Antonio Aravena. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    public enum HomeError {
        case internetError(String)
        case serverMessage(String)
    }

    public let movies: PublishSubject<[Movie]> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let error: PublishSubject<HomeError> = PublishSubject()
    private let disposable = DisposeBag()

    public func getData() {
        self.loading.onNext(true)
        getPopulars(success: { movies in
            self.loading.onNext(false)
            movies.print()
            self.movies.onNext(movies.getList())
        }, faliure: {
            self.loading.onNext(false)
            self.error.onNext(.internetError("Revisa tu conexión a internet."))
        })
    }
}
