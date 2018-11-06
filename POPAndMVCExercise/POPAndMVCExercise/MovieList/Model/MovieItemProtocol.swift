//
//  MovieItemProtocol.swift
//  POPAndMVCExercise
//
//  Created by Kamaluddin Khan on 29/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import Foundation

protocol MovieItemProtocol {
    var title: String? {get }
    var originalLanguage : String? {get }
    var posterPath: String? {get }
    var releaseDate: String? {get }
    var adult: Bool? {get }
}
