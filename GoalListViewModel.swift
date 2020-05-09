

import Foundation
import SwiftUI
import Combine
import CoreData

class GoalListViewModel: ObservableObject {
    
    @Published
    var goal: GoalViewModel? = GoalViewModel()
    
    var targetWeight: String = ""
    
    init () {
        fetchTargetWeight()
    }
        
    func fetchTargetWeight() {
        let goals: [GoalViewModel]? = CoreDataManager.shared.fetchGoal().map(GoalViewModel.init)
        self.goal = goals?.first
    }
}
