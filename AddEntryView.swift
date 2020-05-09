//
//  AddEntryView.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/6/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//

import SwiftUI

struct AddEntryView: View {
    
    @Binding var isPresented: Bool
    @State var addEntryVM = AddEntryViewModel()
    
   
    var body: some View {
        
        NavigationView {
            Group {
                VStack {
                    TextField("Enter weight", text: self.$addEntryVM.weight)
                    
                    Text("Enter Date")
                    
                    DatePicker("Enter Date", selection: self.$addEntryVM.date, displayedComponents: .date)
                        .labelsHidden()
                    
                    Button ("Enter") {
                        self.addEntryVM.saveEntry()
                    }
                }
            }
            navigationBarTitle("Add New Weight Entry")
        }
    }
}

struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView(isPresented: .constant(false))
    }
}
