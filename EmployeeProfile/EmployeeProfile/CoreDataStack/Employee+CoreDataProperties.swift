//
//  Employee+CoreDataProperties.swift
//  EmployeeProfile
//
//  Created by Kamaluddin Khan on 02/11/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var designation: String?
    @NSManaged public var email: String?
    @NSManaged public var experience: Int16
    @NSManaged public var name: String?
    @NSManaged public var skill: String?
    @NSManaged public var id: Int16
    @NSManaged public var mentees: NSSet?
    @NSManaged public var mentor: Employee?

}

// MARK: Generated accessors for mentees
extension Employee {

    @objc(addMenteesObject:)
    @NSManaged public func addToMentees(_ value: Employee)

    @objc(removeMenteesObject:)
    @NSManaged public func removeFromMentees(_ value: Employee)

    @objc(addMentees:)
    @NSManaged public func addToMentees(_ values: NSSet)

    @objc(removeMentees:)
    @NSManaged public func removeFromMentees(_ values: NSSet)

}
