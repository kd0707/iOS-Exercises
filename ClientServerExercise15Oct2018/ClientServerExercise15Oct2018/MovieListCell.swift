//
//  MovieListCell.swift
//  ClientServerExercise15Oct2018
//
//  Created by Kamaluddin Khan on 17/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit
import  SVProgressHUD

class MovieListCell: UITableViewCell {
    @IBOutlet weak var movieCollection: UICollectionView!
    var movieData:[MovieItem] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieCollection.dataSource = self
        movieCollection.delegate = self
        let cellNib = UINib(nibName: "MovieItemCollectionViewCell", bundle: nil)
        movieCollection.register(cellNib, forCellWithReuseIdentifier: "MovieItemCollectionViewCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


extension MovieListCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movieItemCollectionViewCell = movieCollection.dequeueReusableCell(withReuseIdentifier: "MovieItemCollectionViewCell", for: indexPath) as! MovieItemCollectionViewCell

                let data = movieData[indexPath.row]
        let language = data.original_language

        if(language == "en"){
            movieItemCollectionViewCell.movieLanguageLable.text = "English"
        }
        movieItemCollectionViewCell.movieNameLable.text = data.title

        guard let posterPath = data.poster_path else {
            movieItemCollectionViewCell.movieImageView.image = UIImage(named: "poster_not_available")
            return movieItemCollectionViewCell
        }
        let imagrUrl = URL(string:
            "https://image.tmdb.org/t/p/w600_and_h900_bestv2" + posterPath)
        let imageData = try? Data(contentsOf: imagrUrl!)
        movieItemCollectionViewCell.movieImageView.image = UIImage.init(data: imageData!)
        return movieItemCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize.init(width: UIScreen.main.bounds.width - 20, height: 80)
        return CGSize.init(width:130, height:220)// Manages size of items
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = 20    // Leaves space from top & bottom
        return UIEdgeInsets(top: CGFloat(inset), left: CGFloat(inset), bottom: CGFloat(inset), right: CGFloat(inset))
    }
}


extension MovieListCell{
    
    func apiCall(url:String) {
        DispatchQueue.global().async {
            SVProgressHUD.show(withStatus: "Kamal")
            ApiHandler.dataFromApi(urlString: url) { (movieList, responseErr) in
                if responseErr != nil{
                    print("kamalaalal")
                }else{
                    let movieData = movieList as? JSON
                    let movieCatalog = movieData?["results"] as! [JSON]
                    
                    for movieIteration in movieCatalog {
                        let individualMovie = movieIteration as? JSON
                        self.movieData.append(individualMovie.flatMap(MovieItem.init)!)
                    }
                    DispatchQueue.main.async {
                        self.movieCollection.reloadData()
                        SVProgressHUD.dismiss()
                        
                    }
                }
            }
        }
    }
    
}
