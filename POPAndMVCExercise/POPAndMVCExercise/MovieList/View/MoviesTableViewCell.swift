//
//  MoviesTableViewCell.swift
//  POPAndMVCExercise
//
//  Created by Kamaluddin Khan on 25/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit
import Alamofire

class MoviesTableViewCell: UITableViewCell {
     var movieData:[MovieItem?] = []
    let movieCellIdentifier = "MovieCollectionViewCell"

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nibRegistration()
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension MoviesTableViewCell {
    private func nibRegistration() {
        let movieCollectionViewCellNib = UINib(nibName: movieCellIdentifier, bundle: nil)
        moviesCollectionView.register(movieCollectionViewCellNib, forCellWithReuseIdentifier: movieCellIdentifier)
    }
}

extension MoviesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movieCollectionViewCell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: movieCellIdentifier, for: indexPath) as! MovieCollectionViewCell
        let data = movieData[indexPath.row]
        movieCollectionViewCell.setData(data: data)
//        movieCollectionViewCell.titleLabel.text = data?.title
//
//        if (data?.adult)!{
//        movieCollectionViewCell.adultRatingLabel.text = adultRated
//        }else{
//        movieCollectionViewCell.adultRatingLabel.text = universal
//        }
//
//        movieCollectionViewCell.releaseDateLabel.text = data?.releaseDate
//
//        let language = data?.originalLanguage
//        if(language == "hi"){
//            movieCollectionViewCell.languageLabel.text = Language.hi.rawValue
//        }else if(language == "en"){
//            movieCollectionViewCell.languageLabel.text = Language.en.rawValue
//        }
//        else if(language == "pa"){
//            movieCollectionViewCell.languageLabel.text = Language.pa.rawValue
//        }else if(language == "tl"){
//            movieCollectionViewCell.languageLabel.text = Language.tl.rawValue
//        }else if(language == "zh"){
//            movieCollectionViewCell.languageLabel.text = Language.zh.rawValue
//        }else if(language == "es"){
//            movieCollectionViewCell.languageLabel.text = Language.es.rawValue
//        }
//        else{
//            movieCollectionViewCell.languageLabel.text = language
//
//        }
//
//        guard let posterPath = data?.posterPath else {
//            movieCollectionViewCell.movieImageView.image = UIImage(named: "poster_not_available")
//            return movieCollectionViewCell
//        }
//        let imagrUrl = URL(string:
//           headerPathForImage + posterPath)
//        let imageData = try? Data(contentsOf: imagrUrl!)
//        movieCollectionViewCell.movieImageView.image = UIImage.init(data: imageData!)
        return movieCollectionViewCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize.init(width: UIScreen.main.bounds.width - 20, height: 80)
     return CGSize.init(width:240, height:125) // Manages size of items
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        let inset = 20    // Leaves space from top & bottom
        return UIEdgeInsets(top: 3, left: 5, bottom: 3, right: 10)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        collectionView.reloadData()
    }
}

extension MoviesTableViewCell{
    
    func apiHandler(stringUrl:String) {
        Alamofire.request(stringUrl).validate(statusCode: 200..<300).responseJSON { response in
            //            print("Request: \(String(describing: response.request))")   // original url request
            //            print("Response: \(String(describing: response.response))") // http url response
            //            print("Result: \(response.result)")                         // response serialization result
//            print(response.result.value)
            
            if let json = response.result.value as? JSON{
                //                print("JSON: \(json)") // serialized json response\
                //                MovieListing(json: json as! JSON)
                print (MovieListing.init(json: json ))
                let data = MovieListing.init(json: (json )).result
                for movieIteration in data {
                    self.movieData.append(movieIteration!)
                }
                print(self.movieData.count)
                self.moviesCollectionView.reloadData()
                
            }
            
            
            //            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
            //                print("Data: \(utf8Text)") // original server data as UTF8 string
            //            }
            
            
            
        }
    }
        
}
