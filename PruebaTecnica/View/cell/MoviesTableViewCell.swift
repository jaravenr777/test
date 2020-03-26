//
//  MoviesTableViewCell.swift
//  PruebaTecnica
//
//  Created by Jose Antonio Aravena on 25-03-20.
//  Copyright © 2020 Jose Antonio Aravena. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!

    public var cellMovie: Movie! {
       didSet {
            getImage(url: cellMovie.getImage(), completion: { image  in
                if let img = image {
                    if self.movieImage != nil {
                        self.movieImage.image = img
                    }
                }
            })
            self.movieImage.clipsToBounds = true
            self.movieImage.layer.cornerRadius = 3
            self.movieTitle.text = cellMovie.title
       }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        movieImage.image = UIImage()
    }
    override func prepareForReuse() {
       movieImage.image = UIImage()
    }
}
