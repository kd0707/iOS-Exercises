//
//  MovieItem.swift
//  ClientServerExercise15Oct2018
//
//  Created by Kamaluddin Khan on 18/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import Foundation
struct MovieItem {
    var title: String?
    var original_language : String?
    var poster_path: String?
}

extension MovieItem{
    init(json: JSON) {
        self.title = json["title"] as? String
        self.original_language = json["original_language"] as? String
        self.poster_path = json["poster_path"] as? String
    }
}
