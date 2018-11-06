//
//  MovieListingProtocol.swift
//  POPAndMVCExercise
//
//  Created by Kamaluddin Khan on 29/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import Foundation

protocol MovieListingProtocol {
    var page: Int?{get}
    
    var totalPages: Int?{get }
    
    var totalResults : Int?{get }
    
    var result : [MovieItem?]{get }
}

