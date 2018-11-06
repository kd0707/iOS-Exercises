//
//  MovieListing.swift
//  ClientServerExercise15Oct2018
//
//  Created by Kamaluddin Khan on 18/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import Foundation
struct MovieListing {
    var page: Int?
    var total_pages: Int?
    var total_results : Int?
    var result : [MovieItem] = []
}

extension MovieListing{
    init(json: JSON) {
        self.page = json["page"] as? Int
        self.total_pages = json["total_pages"] as? Int
        self.total_results = json["total_results"] as? Int
        let itemResult = json["results"]  as! [JSON]
        for item in itemResult{
            let movie = item as? JSON
            self.result.append(movie.flatMap(MovieItem.init)!)
        }
    }
}
