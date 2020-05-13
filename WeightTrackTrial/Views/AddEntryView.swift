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
    @State private var showFrontImagePicker: Bool = false
    @State private var showSideImagePicker: Bool = false
    @State private var showBackImagePicker: Bool = false
    @State private var frontImage: UIImage?
    @State private var sideImage: UIImage?
    @State private var backImage: UIImage?
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                ExtractedView(addEntryVM: self.$addEntryVM, showFrontImagePicker: self.$showFrontImagePicker, showSideImagePicker: self.$showSideImagePicker, showBackImagePicker: self.$showBackImagePicker, frontImage: self.$frontImage, sideImage: self.$sideImage, backImage: self.$backImage)
                
                Group {
                    VStack {
                        
                        TextField("Enter weight", text: self.$addEntryVM.weight)
                            .multilineTextAlignment(TextAlignment.center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        Text("Enter Date")
                        
                        DatePicker("Enter Date", selection: self.$addEntryVM.date, displayedComponents: .date)
                            .labelsHidden()
                        
                        Button ("Enter") {
                            self.addEntryVM.saveEntry()
                        }
                    }
                }
            }
            .navigationBarTitle("Add Entry")
        }
    }
}

struct ExtractedView: View {
    
    @Binding var addEntryVM: AddEntryViewModel
    @Binding var showFrontImagePicker: Bool
    @Binding var showSideImagePicker: Bool
    @Binding var showBackImagePicker: Bool
    @Binding var frontImage: UIImage?
    @Binding var sideImage: UIImage?
    @Binding var backImage: UIImage?
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                
                VStack {
                    Image(uiImage: self.addEntryVM.frontImg)
                        .resizable()
                        .frame(width: 80, height: 80)
                    
                    Button("Front") {
                        self.showFrontImagePicker = true
                    }
                    .padding()
                    .sheet(isPresented: $showFrontImagePicker) {
                        ImagePicker(image: self.$addEntryVM.frontImg, isShown: self.$showFrontImagePicker)
                    }
                }
                
                Spacer()
                
                /*VStack {
                    Image(uiImage: sideImage ?? UIImage(systemName: "person")!)
                        .resizable()
                        .frame(width: 80, height: 80)
                    
                    Button("Side") {
                        self.showSideImagePicker = true
                    }
                    .padding()
                    .sheet(isPresented: $showSideImagePicker) {
                        ImagePicker(image: self.$sideImage, isShown: self.$showSideImagePicker)
                    }
                }
                
                Spacer()
                
                VStack {
                    Image(uiImage: backImage ?? UIImage(systemName: "person")!)
                        .resizable()
                        .frame(width: 80, height: 80)
                    
                    Button("Back") {
                        self.showBackImagePicker = true
                    }
                    .padding()
                    .sheet(isPresented: $showBackImagePicker) {
                        ImagePicker(image: self.$backImage, isShown: self.$showBackImagePicker)
                    }
                }*/
                
                Spacer()
            }
            
        }
    }
}



struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView(isPresented: .constant(false))
    }
}
