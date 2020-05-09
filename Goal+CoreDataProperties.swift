//
//  Goal+CoreDataProperties.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/9/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var targetWeight: String?
    
    /*public var wrappedTargetWeight: String {
        return targetWeight ?? "Unkown"
    }*/

}
