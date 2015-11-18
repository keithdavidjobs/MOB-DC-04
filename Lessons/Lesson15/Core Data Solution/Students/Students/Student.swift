//
//  Student.swift
//  Students
//
//  Created by TK on 7/26/15.
//  Copyright (c) 2015 Tedi Konda. All rights reserved.
//

import Foundation
import CoreData

class Student: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var location: String

}
