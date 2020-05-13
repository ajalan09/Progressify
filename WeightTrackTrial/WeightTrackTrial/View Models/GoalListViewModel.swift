//
//  GoalListViewModel.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/9/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
import Combine

class GoalListViewModel: ObservableObject {
   
    @Published var goals: [GoalViewModel] = [GoalViewModel]()
    
    
    init() { //when initiliazed, fetch all goals
        fetchGoal()
    }
    
    func fetchGoal() {
        self.goals = CoreDataManager.shared.getAllGoals().map(GoalViewModel.init)
        print(goals)
    }
    
    func fetchAnswer() -> GoalViewModel {
        self.goals.last!
    }
    
    
}

class GoalViewModel {
    var targetWeight = ""
    
    init(goal: Goal) {
        self.targetWeight = goal.targetWeight!
    }
}
