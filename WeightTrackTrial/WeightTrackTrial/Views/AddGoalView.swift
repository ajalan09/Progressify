//
//  AddGoalView.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/9/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//

import SwiftUI
import CoreData
import UIKit

struct AddGoalView: View {
    
    @State var addGoalVM = AddGoalViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        ZStack {
            
            ColorManager.BackgroundColor
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { g in
                
                VStack(alignment: .center) {
                    
                    TextField("Enter Goal Weight", text: self.$addGoalVM.targetWeight)
                        .keyboardType(.numbersAndPunctuation)
                        .multilineTextAlignment(TextAlignment.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(20)
                        .frame(width: g.size.width*0.8, height: 100, alignment: .center)
                        .font(.system(size: 20.0, weight: .regular, design: .rounded))
                        
                    
                    
                    Button(action: {
                        self.addGoalVM.saveGoal()
                        //self.presentationMode.wrappedValue.dismiss()
                    }) {
                        
                        ZStack(alignment: .center) {
                            
                            Rectangle()
                                .frame(width: g.size.width*0.5, height: 50)
                                .background(ColorManager.CustomBlue)
                                .cornerRadius(100)
                            Text("Save")
                            .padding(8)
                            //.background(ColorManager.CustomBlue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .font(.system(size: 20.0, weight: .regular, design: .rounded))
                        }
                        
                    }
                    
                    
                    
                }
            }
        }
    }
}


struct AddGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddGoalView()
    }
}
