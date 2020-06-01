//
//  TransformationView.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/13/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//

import SwiftUI
import CoreData
import UIKit

/*struct TransformationView: View {
    
    var entryListVM: EntryListViewModel
    @State private var showFront: Bool = false
    @State private var showSide: Bool = false
    @State private var showBack: Bool = false

    var body: some View {
        VStack {
            HStack {
                Button("Front") {
                    self.showFront.toggle()
                }
                
                Button("Side") {
                    self.showSide.toggle()
                }
                
                Button("Back") {
                    self.showBack.toggle()
                }
            }
            
            Spacer()
            
            VStack {
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 10) {
                        ForEach(self.entryListVM.entries, id: \.weight) { entry in
                            VStack {
                                Text("\(entry.weight)")
                                
                                if (self.showFront) {
                                    Image(uiImage: (UIImage(data: (entry.frontImg ?? UIImage(systemName: "person")?.pngData())!)!))
                                        .resizable()
                                        .frame(width: 100, height: 100)
                            }
                                
                                if (self.showSide) {
                                    Image(uiImage: (UIImage(data: (entry.sideImg ?? UIImage(systemName: "person")?.pngData())!)!))
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                }
                                
                                if (self.showBack) {
                                    Image(uiImage: (UIImage(data: (entry.backImg ?? UIImage(systemName: "person")?.pngData())!)!))
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                }
                                
                                Text((entry.date).toString(dateFormat: "dd-MMM-yyyy"))
                            }
                        }
                    }
                }
            }
            
            Spacer()
            
            HStack {
                Button("Close Front") {
                    self.showFront = false
                }
                
                Button("Close Side") {
                    self.showSide = false
                }
                
                Button("Close Back") {
                    self.showBack = false
                }
            }
        }
    }
}
*/
struct TransformationView: View {
    var entryListVM: EntryListViewModel
    @State private var selectedWeight: String
    
    var body: some View {
        Picker(selection: self.$selectedWeight, label: Text("")) {
            //ForEach(Array(self.entryListVM.entries.enumerated()) , id: \.1.id) { (index,entry) in
            ForEach(0..<self.entryListVM.entries.count) {
                Text(self.entryListVM.entries[$0].weight).tag($0)
            }
        }
    }
}
        
