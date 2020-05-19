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
    var changeAndColor: (String,Color?,String)
    
    var body: some View {
        HStack {
            VStack {
                Text((entry.date).toString(dateFormat: "dd-MMM-yyyy"))
                    .foregroundColor(ColorManager.WriteGray)
                    .font(.system(size: 14.0, weight: .light, design: .rounded))
                
                if (changeAndColor.0 == "0.0") {
                    Spacer()
                }
                
                HStack (alignment: .center) {
                    
                    if (changeAndColor.0 != "0.0") {
                        Image(systemName: changeAndColor.2)
                            .foregroundColor(changeAndColor.1)
                            .font(.system(size: 14.0, weight: .regular, design: .rounded))
                    }

                    Text("\(changeAndColor.0) kg")
                        .foregroundColor(changeAndColor.1)
                        .font(.system(size: 14.0, weight: .regular, design: .rounded))
                }
            }
            
            Spacer()
            
            
            
            Spacer()
            
            HStack (alignment: .lastTextBaseline, spacing: 3)  {
                Text(String(format: "%.1f",  (entry.weight as NSString).doubleValue))
                .foregroundColor(Color(white: 1.8))
                .font(.system(size: 25.0, weight: .bold, design: .rounded))
                
                Text("kg")
                .foregroundColor(Color(white: 1.8))
                .font(.system(size: 16.0, weight: .light, design: .rounded))
            }
            
            
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




