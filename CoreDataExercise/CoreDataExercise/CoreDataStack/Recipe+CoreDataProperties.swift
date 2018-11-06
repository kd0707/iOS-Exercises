//
//  Recipe+CoreDataProperties.swift
//  CoreDataExercise
//
//  Created by Kamaluddin Khan on 31/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?

}
