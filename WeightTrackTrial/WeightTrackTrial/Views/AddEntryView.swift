//
//  AddEntryView.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/6/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//

import SwiftUI
import CoreData
import UIKit

struct AddEntryView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var isPresented: Bool
    @State var addEntryVM = AddEntryViewModel()
    @State private var showFrontImagePicker: Bool = false
    @State private var showSideImagePicker: Bool = false
    @State private var showBackImagePicker: Bool = false
    @State private var frontImage: UIImage?
    @State private var sideImage: UIImage?
    @State private var backImage: UIImage?
    
    /*init() {
        UIDatePicker.appearance().backgroundColor = .clear
    }*/
    
    var body: some View {
        
        ZStack(alignment: .center) {
            ColorManager.BackgroundColor
                .edgesIgnoringSafeArea(.all)
            
            
            GeometryReader { g in
                VStack(alignment: .leading) { //Whole Page
                    
                    VStack {  //1) Header
                        Text("Add New Entry")
                            .font(.system(size: 30.0, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.leading)
                        
                        }.padding()
                        
                        .frame(height: g.size.height*0.10)
    
                    
                    VStack(alignment: .center) {  //2) Transformation Images section
                        Text("Transformation Images (optional)")
                            .font(.system(size: 15.0, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.bottom)
                        
                        
                        ExtractedView(addEntryVM: self.$addEntryVM, showFrontImagePicker: self.$showFrontImagePicker, showSideImagePicker: self.$showSideImagePicker, showBackImagePicker: self.$showBackImagePicker, g: g)
                    }
                .padding()
                    .frame(height: g.size.height*0.20)
                    
                    VStack(alignment: .center) {  //3) Weight & Date Section
                        Text("Weight & Date")
                            .font(.system(size: 15.0, weight: .regular, design: .rounded))
                            .foregroundColor(.white)
                            
                        
                        
                        TextField("Enter Weight", text: self.$addEntryVM.weight)
                            .keyboardType(.numbersAndPunctuation)
                            .multilineTextAlignment(TextAlignment.center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                                                    .font(.system(size: 15.0, weight: .light, design: .rounded))
                            .frame(width: g.size.width*0.8, height: 50, alignment: .center)

                        .frame(width: g.size.width)
                        
                        DatePicker(selection: self.$addEntryVM.date, displayedComponents: .date) {
                            Text("Select Date")
                        }
                                                   .labelsHidden()
                                                   .colorInvert()
                        .colorMultiply(self.colorScheme == .dark ? .white : .white)
                                                   .offset(x: 5)

                            
                    }.padding()
                    .frame(height: g.size.height*0.50)
                    
                    
                    
                    VStack(alignment: .center) {  //4) Save Button Section
                        Button(action: {
                            self.addEntryVM.saveEntry()
                            self.presentationMode.wrappedValue.dismiss()
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
                            }.frame(width: g.size.width)
                            
                        }
                    }.padding()
                    .frame(height: g.size.height*0.15)
                        
                
                }
                .frame(width: g.size.width, height: g.size.height)
            }
        }
        
        
    }
}

struct ExtractedView: View {
    
    @Binding var addEntryVM: AddEntryViewModel
    @Binding var showFrontImagePicker: Bool
    @Binding var showSideImagePicker: Bool
    @Binding var showBackImagePicker: Bool
    var g: GeometryProxy
    
    var body: some View {
        
        VStack {
            
           HStack { //whole
            
           Spacer(minLength: g.size.width*0.05)
            
            Button(action: {
                    self.showFrontImagePicker = true
                }) {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(width: g.size.width*0.26, height: 50)
                            .cornerRadius(12)
                            //.frame(width: 100, height: 100)
                        
                        HStack {
                            Image(systemName: "photo")
                                .accentColor(.white)                                
                            Text("Front View")
                                .font(.system(size: 12.0, weight: .light, design: .rounded))
                                .foregroundColor(.white)
                        }
                    }
                }
                .sheet(isPresented: $showFrontImagePicker) {
                    ImagePicker(image: self.$addEntryVM.frontImg, isShown: self.$showFrontImagePicker)
                }
                
            Spacer(minLength: g.size.width*0.05)
            //Spacer()
            
                Button(action: {
                    self.showSideImagePicker = true
                }) {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(width: g.size.width*0.26, height: 50)
                            .cornerRadius(12)
                            //.frame(width: 100, height: 100)
                        
                        HStack {
                            Image(systemName: "photo")
                                .accentColor(.white)
                            Text("Side View")
                                .font(.system(size: 12.0, weight: .light, design: .rounded))
                                .foregroundColor(.white)
                        }
                    }
                }
                .sheet(isPresented: $showSideImagePicker) {
                    ImagePicker(image: self.$addEntryVM.sideImg, isShown: self.$showSideImagePicker)
                }
            
Spacer(minLength: g.size.width*0.05)
                
                Button(action: {
                    self.showBackImagePicker = true
                }) {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .frame(width: g.size.width*0.26, height: 50)
                            .cornerRadius(12)
                            //.frame(width: 100, height: 100)
                        
                        HStack {
                            Image(systemName: "photo")
                                .accentColor(.white)
                            Text("Back View")
                                .font(.system(size: 12.0, weight: .light, design: .rounded))
                                .foregroundColor(.white)
                        }
                    }
                }
                .sheet(isPresented: $showBackImagePicker) {
                    ImagePicker(image: self.$addEntryVM.backImg, isShown: self.$showBackImagePicker)
                }
            
            Spacer(minLength: g.size.width*0.05)
            
            }
            
            
            /*HStack {
             Spacer()
             
             VStack {
             Image(uiImage: self.addEntryVM.frontImg)
             .resizable()
             .accentColor(.white)
             .frame(width: 80, height: 80)
             .scaledToFit()
             
             
             Button("Front") {
             self.showFrontImagePicker = true
             }
             .padding()
             .sheet(isPresented: $showFrontImagePicker) {
             ImagePicker(image: self.$addEntryVM.frontImg, isShown: self.$showFrontImagePicker)
             }
             }
             
             Spacer()
             
             VStack {
             Image(uiImage: self.addEntryVM.sideImg)
             .resizable()
             .frame(width: 80, height: 80)
             
             Button("Side") {
             self.showSideImagePicker = true
             }
             .padding()
             .sheet(isPresented: $showSideImagePicker) {
             ImagePicker(image: self.$addEntryVM.sideImg, isShown: self.$showSideImagePicker)
             }
             }
             
             Spacer()
             
             VStack {
             Image(uiImage: self.addEntryVM.backImg)
             .resizable()
             .frame(width: 80, height: 80)
             
             Button("Back") {
             self.showBackImagePicker = true
             }
             .padding()
             .sheet(isPresented: $showBackImagePicker) {
             ImagePicker(image: self.$addEntryVM.backImg, isShown: self.$showBackImagePicker)
             }
             }
             
             Spacer()
             }
            */
        }
    }
}



struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView(isPresented: .constant(false))
    }
}



