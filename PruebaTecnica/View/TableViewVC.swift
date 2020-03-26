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

class TableViewVC: UITableViewController {
    public var movies = PublishSubject<[Movie]>()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBinding()
    }

    private func setupTableView() {
        tableView.delegate = nil
        tableView.dataSource = nil
        tableView.tableFooterView = UIView()
        tableView.rx.modelSelected(Movie.self)
            .subscribe(onNext: { [weak self] movie in
                let viewController = InfoVC()
                viewController.completionHandler = {
                    return movie
                }
              self?.present(viewController, animated: true)
        }).disposed(by: disposeBag)

        tableView.rx.setDelegate(self)
        .disposed(by: disposeBag)
    }
    private func setupBinding() {
        tableView.register(UINib(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        movies.bind(to: tableView.rx.items(cellIdentifier: "cell",
                                           cellType: MoviesTableViewCell.self)) { _, movie, cell in
            cell.cellMovie = movie
        }.disposed(by: disposeBag)
    }
}

extension TableViewVC {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    override func tableView(_ tableView: UITableView,
                            willDisplayFooterView view: UIView, forSection section: Int) {
        print("hola")
    }
}
