//
//  InfoVC.swift
//  PruebaTecnica
//
//  Created by Jose Antonio Aravena on 25-03-20.
//  Copyright © 2020 Jose Antonio Aravena. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {
    var completionHandler:(() -> Movie)!

    var infoViewModel = InfoViewModel()
    var label2: UILabel!
    var genre: String! = nil {
        didSet {
            label2.attributedText = NSMutableAttributedString(string: self.genre,
                    attributes: [NSAttributedString.Key.paragraphStyle: NSMutableParagraphStyle()])
            view.addSubview(label2)
        }
    }
    override func viewDidLoad() {
        //setupBindings()
        super.viewDidLoad()
        let movie = completionHandler()
        infoViewModel.getData(movie: movie, completion: { genre in
            self.genre = genre
        })
        self.view.backgroundColor = .white
        initializeImage(movie: movie)
        initializeText(movie: movie)
    }

    private func initializeImage(movie: Movie) {
        let imagenView = UIImageView(image: UIImage(named: ""))
        view.addSubview(imagenView)
        imagenView.translatesAutoresizingMaskIntoConstraints = false
        imagenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true
        imagenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        imagenView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        getImage(url: movie.getImage(), completion: { image in
            if let img = image {
                imagenView.image = img
                imagenView.heightAnchor.constraint(equalToConstant: 500).isActive = true
            }
        })
    }

    private func initializeText(movie: Movie) {
        let label1 = UILabel(frame: CGRect(x: 60, y: 550, width: 300, height: 200))
        label1.attributedText = NSMutableAttributedString(string: movie.overview,
                                    attributes: [NSAttributedString.Key.paragraphStyle: NSMutableParagraphStyle()])
        view.addSubview(label1)
        label2 = UILabel(frame: CGRect(x: 60, y: 600, width: 300, height: 200))
        view.addSubview(label2)
    }
}
