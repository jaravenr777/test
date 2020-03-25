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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        setupBindings()
        homeViewModel.getData()
    }

    private lazy var moviesViewController: TableViewVC = {
        var viewController = TableViewVC()
        //self.addChild(viewController)
        //self.view.addSubview(viewController.view)

        
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
            })
            .disposed(by: disposeBag)

        homeViewModel
            .movies
            .observeOn(MainScheduler.instance)
            .bind(to: moviesViewController.movies)
            .disposed(by: disposeBag)
    }
}
