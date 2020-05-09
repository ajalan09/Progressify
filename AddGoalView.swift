//
//  AddGoalView.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/7/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//

import SwiftUI

struct AddGoalView: View {
    
    @State private var addGoalVM = AddGoalViewModel()
    @Binding var GoalisPresented: Bool
    
    
    var body: some View {
        
        VStack {
            
            TextField("Enter Target Goal", text: self.$addGoalVM.targetWeight)
            
            Button ("Enter Goal Weight") {
                //self.GoalisPresented = false
                self.addGoalVM.saveGoal()
            }
            
        }
        
    }
}

struct AddGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalView(GoalisPresented: .constant(false))
    }
}
