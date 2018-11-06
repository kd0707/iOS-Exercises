//
//  MovieListing.swift
//  ClientServerExercise15Oct2018
//
//  Created by Kamaluddin Khan on 18/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import Foundation
struct MovieListing : MovieListingProtocol {
    var page: Int?
    
    var totalPages: Int?
    
    var totalResults: Int?
    
    var result: [MovieItem?] = []
}

extension MovieListing {
    init(json: JSON) {
        self.page = json["page"] as? Int
        self.totalPages = json["total_pages"] as? Int
        self.totalResults = json["total_results"] as? Int
        let itemResult = json["results"] as? [JSON]
        for item in itemResult!{
            let movie = item as? JSON
            result.append(movie.flatMap(MovieItem.init))
        }
    }
}
