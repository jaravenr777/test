//
//  TableViewVC.swift
//  PruebaTecnica
//
//  Created by Jose Antonio Aravena on 25-03-20.
//  Copyright © 2020 Jose Antonio Aravena. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TableViewVC: UIViewController {
    private var moviesTableView: UITableView!
    public var movies = PublishSubject<[Movie]>()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView=UITableView()
        setupBinding()
    }

    private func setupBinding() {
        moviesTableView.register(UINib(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

        movies.bind(to: moviesTableView.rx.items(cellIdentifier: "cell", cellType: MoviesTableViewCell.self)) {  (_, movie, cell) in
            cell.cellMovie = movie
            print(movie.title)
            }.disposed(by: disposeBag)
    }
}
