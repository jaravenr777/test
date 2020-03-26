//
//  HomeVC.swift
//  PruebaTecnica
//
//  Created by Jose Antonio Aravena on 25-03-20.
//  Copyright © 2020 Jose Antonio Aravena. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: UIViewController {

    var homeViewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    let loading = UIActivityIndicatorView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        self.view.addSubview(loading)
        loading.isHidden = false
        setupBindings()
        homeViewModel.getData()
    }

    private lazy var moviesViewController: TableViewVC = {
        var viewController = TableViewVC()
        addChild(viewController)
        self.view.addSubview(viewController.view)
        viewController.view.frame = self.view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)

        return viewController
    }()

    private func setupBindings() {
        homeViewModel
        .error
        .observeOn(MainScheduler.instance)
        .subscribe(onNext: { (error) in
            print(error)
            switch error {
            case .internetError(let message):
                    let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    }))
                    self.present(alert, animated: true, completion: nil)

            case .serverMessage(let message):
                    let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    }))
                    self.present(alert, animated: true, completion: nil)
            }
        })
        .disposed(by: disposeBag)

        homeViewModel
        .movies
        .observeOn(MainScheduler.instance)
        .bind(to: moviesViewController.movies)
        .disposed(by: disposeBag)

        homeViewModel
        .loading
            .bind(to: self.loading.rx.isAnimating)
        .disposed(by: disposeBag)
    }
}
