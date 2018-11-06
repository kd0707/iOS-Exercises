//
//  movieItemCollectionViewCell.swift
//  ClientServerExercise15Oct2018
//
//  Created by Kamaluddin Khan on 17/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit

class MovieItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieLanguageLable: UILabel!
    
    @IBOutlet weak var movieNameLable: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImageView.layer.cornerRadius = 8.0
        movieImageView.clipsToBounds = true
        // Initialization code
    }

}
