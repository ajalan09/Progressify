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

/*class GoalListViewModel: ObservableObject {
   
    @Published var goals: [GoalViewModel] = [GoalViewModel]()
    
    
    init() { //when initiliazed, fetch all goals
        fetchGoal()
    }
    
    func fetchGoal() {
        self.goals = CoreDataManager.shared.getAllGoals().map(GoalViewModel.init)
        print(goals)
    }
    
    func fetchAnswer() -> String {
        let temp: Double = ((self.goals.last?.targetWeight ?? "0.0") as NSString).doubleValue
        return String(format: "%.1f", temp)
    }
    
    
}*/

class GoalListViewModel: ObservableObject {
   
    @Published var goals: [GoalViewModel] = [GoalViewModel]()
    @Published var goal = "0.0"
    
    
    init() { //when initiliazed, fetch all goals
        fetchGoal()
        fetchAnswer()
    }
    
    func fetchGoal() {
        self.goals = CoreDataManager.shared.getAllGoals().map(GoalViewModel.init)
        print(goals)
    }
    
    func fetchAnswer() -> String {
        let temp: Double = ((self.goals.last?.targetWeight ?? "0.0") as NSString).doubleValue
        self.goal = String(format: "%.1f", temp)
        return self.goal
    }
    
    
}

class GoalViewModel {
    var targetWeight = "Unkown"
    
    init(goal: Goal) {
        self.targetWeight = goal.targetWeight!
    }
}
