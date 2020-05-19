//
//  ProgressCellView.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/18/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//

import SwiftUI
import UIKit

struct ProgressCellView: View {
    var entry: EntryViewModel
    @Binding var linkIsPresented: Bool
    
    var body: some View {
        HStack {
            Text((entry.date).toString(dateFormat: "dd-MMM-yyyy"))
                .foregroundColor(ColorManager.WriteGray)
                .font(.system(size: 14.0, weight: .light, design: .rounded))
                
            Spacer()

            
            Text(entry.weight)
                .foregroundColor(Color(white: 1.8))
                .font(.system(size: 25.0, weight: .bold, design: .rounded))
            
             Button(action: {
                self.linkIsPresented = true
             }) {
                Image(systemName: "chevron.right")
                    .foregroundColor(ColorManager.WriteGray)
            }
            .sheet(isPresented: self.$linkIsPresented, onDismiss: {
                
            }, content: {
                ProgressPicView(entry: self.entry)
            })
                  
            
            
                
                
                
        }
    }
}



