//
//  MovieItem.swift
//  ClientServerExercise15Oct2018
//
//  Created by Kamaluddin Khan on 18/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import Foundation
//import  Alamofire
typealias  JSON = [String:Any?]
struct MovieItem : MovieItemProtocol {
    var title: String?
    
    var originalLanguage: String?
    
    var posterPath: String?
    
    var releaseDate: String?
    
    var adult: Bool?
}

extension MovieItem {
    init(json: JSON) {
        self.title = json["title"] as? String
        self.originalLanguage = json["original_language"] as? String
        self.posterPath = json["poster_path"] as? String
        self.releaseDate = json["release_date"] as? String
        self.adult = json["adult"] as? Bool
    }
    
    func titleString() -> String? {
        return title
    }
    func originalLanguageString() -> String? {
        return originalLanguage
    }
    func posterPathString() -> String? {
        return originalLanguage
    }
    func releaseDateString() -> String? {
        return originalLanguage
    }
    func adultValue() -> Bool? {
        return adult
    }
}
