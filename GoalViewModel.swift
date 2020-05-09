//
//  GoalViewModel.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/7/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//



import Foundation
import SwiftUI
import Combine
import CoreData


class GoalViewModel {
    
    var targetWeight = ""
    
    init () {
        
    }
    
    init(goal: Goal) {
        self.targetWeight = goal.targetWeight!
    }

}
