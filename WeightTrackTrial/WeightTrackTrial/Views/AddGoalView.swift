//
//  AddGoalView.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/9/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//

import SwiftUI

struct AddGoalView: View {
    
    @State var addGoalVM = AddGoalViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            
            TextField("Enter Goal Weight", text: self.$addGoalVM.targetWeight)
                .multilineTextAlignment(TextAlignment.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(8)
            
            Button("Add Goal Weight") {
                self.addGoalVM.saveGoal()
                
            }.padding(8)
                
        }
    }
}

struct AddGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalView()
    }
}
