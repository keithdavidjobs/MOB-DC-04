//
//  Person.swift
//  PeoplePersistance
//
//  Created by Shalev on 11/16/15.
//  Copyright © 2015 Shalev. All rights reserved.
//

import Foundation
import CoreData

class Person: NSManagedObject
{
    @NSManaged var name: String
    @NSManaged var age: Int32
    @NSManaged var gender: String
}