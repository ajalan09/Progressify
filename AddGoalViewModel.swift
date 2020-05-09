//
//  AddGoalViewModel.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/7/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//

import Foundation
import SwiftUI

class AddGoalViewModel {
    
    var targetWeight: String = ""
    
    func saveGoal () {
        CoreDataManager.shared.saveGoal(targetWeight: self.targetWeight)
    }
}
