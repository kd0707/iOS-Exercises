//
//  movieCollectionViewCell.swift
//  POPAndMVCExercise
//
//  Created by Kamaluddin Khan on 25/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var adultRatingLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK:- Setting data to object
    func setData(data : MovieItem?) {
       titleLabel.text = data?.title
        if (data?.adult)!{
            adultRatingLabel.text = adultRated
        }else{
            adultRatingLabel.text = universal
        }
        
        releaseDateLabel.text = data?.releaseDate
        
        let language = data?.originalLanguage
        if(language == "hi"){
            languageLabel.text = Language.hi.rawValue
        }else if(language == "en"){
          languageLabel.text = Language.en.rawValue
        }
        else if(language == "pa"){
            languageLabel.text = Language.pa.rawValue
        }else if(language == "tl"){
            languageLabel.text = Language.tl.rawValue
        }else if(language == "zh"){
            languageLabel.text = Language.zh.rawValue
        }else if(language == "es"){
            languageLabel.text = Language.es.rawValue
        }
        else{
            languageLabel.text = language
            
        }
        
        guard let posterPath = data?.posterPath else {
            movieImageView.image = UIImage(named: "poster_not_available")
            return
        }
        let imagrUrl = URL(string:
            headerPathForImage + posterPath)
        let imageData = try? Data(contentsOf: imagrUrl!)
        movieImageView.image = UIImage.init(data: imageData!)
    }

}
