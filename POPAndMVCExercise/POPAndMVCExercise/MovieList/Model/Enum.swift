//
//  Enum.swift
//  POPAndMVCExercise
//
//  Created by Kamaluddin Khan on 31/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import Foundation

enum SectionTitle:String {
    case Popular = "Popular "
    case VoteAverage = "By Vote Average"
    case ForRevenue = "By Revenue"
}

enum SectionNumber: Int {
    case Zero = 0
    case One
    case Two
}

enum Language: String{
    case en = "English"
    case hi = "Hindi"
    case pa = "Punjabi"
    case zh = "Chinese"
    case tl = "Tagalog"
    case es = "Spanish"
}
