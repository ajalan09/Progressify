//
//  ProgressPicView.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/13/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//

import SwiftUI
import CoreData
import UIKit

struct EntryInfoView: View {
    
    
    var changeAndBeginColor: (String,Color?,String)
    var entry: EntryViewModel
    @State var selectedView = 0
    
    var body: some View {
        ZStack {
            ColorManager.BackgroundColor
                .edgesIgnoringSafeArea(.all)
            
            GeometryReader { g in
                VStack(alignment: .center) {
                    
                    Text("Entry on \((self.entry.date).toString(dateFormat: "dd-MMM-yyyy"))")
                        .frame(height: g.size.height*0.05)
                        .font(.system(size: 30.0, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(24)
                    
                    
                    
                    HStack {
                        
                        Spacer()
                        
                        VStack {
                            Spacer()
                            
                            Text("Weight")
                                .font(.system(size: 15.0, weight: .light, design: .rounded))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            HStack(alignment: .firstTextBaseline, spacing: 2) {
                                Text(String(format: "%.1f",  (self.entry.weight as NSString).doubleValue))
                                    .font(.system(size: 30.0, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                                
                                Text("kg")
                                    .font(.system(size: 15.0, weight: .light, design: .rounded))
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            Spacer()
                            
                        }
                        .frame(width: g.size.width*0.40, height: g.size.height*0.2)
                        .background(ColorManager.ProgressBackground)
                        .cornerRadius(20)
                        
                        Spacer()
                        Spacer()
                        
                        VStack {
                            Spacer()
                            
                            VStack {
                                Text("Net Weight")
                                Text("(Since Beginning)")
                            }
                            .font(.system(size: 15.0, weight: .light, design: .rounded))
                            .foregroundColor(.white)
                            .offset(x: 0, y: -5)
                            
                            Spacer()
                            
                            HStack(alignment: .firstTextBaseline, spacing: 2) {
                                Image(systemName: "\(self.changeAndBeginColor.2)")
                                    .font(.system(size: 25.0, weight: .regular, design: .rounded))
                                    .foregroundColor(self.changeAndBeginColor.1)
                                    .padding(.horizontal, 5)
                                Text("\(self.changeAndBeginColor.0)")
                                    .font(.system(size: 30.0, weight: .bold, design: .rounded))
                                    .foregroundColor(self.changeAndBeginColor.1)
                                
                                Text("kg")
                                    .font(.system(size: 15.0, weight: .light, design: .rounded))
                                    .foregroundColor(self.changeAndBeginColor.1)
                            } .offset(x: 0, y: -5)
                            
                            
                            
                            Spacer()
                            Spacer()
                            
                        }
                        .frame(width: g.size.width*0.40, height: g.size.height*0.2)
                        .background(ColorManager.ProgressBackground)
                        .cornerRadius(20)
                        
                        
                        
                        Spacer()
                    }.frame(width: g.size.width*0.20)
                    
                    Spacer()
                    
                    
                    VStack(alignment: .center) {
                        Picker(selection: self.$selectedView, label: Text("")) {
                            Text("Front").tag(0)
                            Text("Side").tag(1)
                            Text("Back").tag(2)
                        }.pickerStyle(SegmentedPickerStyle())
                            .padding(.horizontal, 24)
                        
                        HStack {
                            PhotoView(value: self.selectedView, entry: self.entry)
                        }
                            
                        
                    }.frame(height: g.size.height*0.60)
                    
                    Spacer()
                        .frame(height: g.size.height*0.05)
                }
                
            }
            
            
        }
    }
}

struct PhotoView: View {
    
    @State var scale: CGFloat = 1.0
    @State var isTapped: Bool = false
    @State var pointTapped: CGPoint = CGPoint.zero
    @State var draggedSize: CGSize = CGSize.zero
    @State var previousDragged: CGSize = CGSize.zero
    
    @State var scale2: CGFloat = 1.0
    @State var isTapped2: Bool = false
    @State var pointTapped2: CGPoint = CGPoint.zero
    @State var draggedSize2: CGSize = CGSize.zero
    @State var previousDragged2: CGSize = CGSize.zero
    
    @State var scale3: CGFloat = 1.0
    @State var isTapped3: Bool = false
    @State var pointTapped3: CGPoint = CGPoint.zero
    @State var draggedSize3: CGSize = CGSize.zero
    @State var previousDragged3: CGSize = CGSize.zero
    
    var value: Int
    var entry: EntryViewModel
    var body: some View {
        VStack(alignment: .center) {
            GeometryReader { reader in
                if (self.value == 0) {
                    
                    HStack {
                        Spacer()
                    
                    Image(uiImage: (UIImage(data: (self.entry.frontImg ?? UIImage(systemName: "person")?.pngData())!)!))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(12)
                        .animation(.default).offset(x: self.draggedSize.width, y: 0).scaleEffect(self.scale).scaleEffect(self.isTapped ? 2 : 1, anchor: UnitPoint(x: self.pointTapped.x / reader.frame(in: .global).maxX, y: self.pointTapped.y / reader.frame(in: .global).maxY)).gesture(TapGesture(count: 2).onEnded({
                                    self.isTapped = !self.isTapped
                                }).simultaneously(with: DragGesture(minimumDistance: 0, coordinateSpace: .global).onChanged({ (value) in
                                    self.pointTapped = value.startLocation
                                    self.draggedSize = CGSize(width: value.translation.width + self.previousDragged.width, height: value.translation.height + self.previousDragged.height)
                        //            print(value.startLocation)
                                }).onEnded({ (value) in
                        //            print(value.location)
                                    let offsetWidth = (reader.frame(in: .global).maxX * self.scale - reader.frame(in: .global).maxX) / 2
                                    let newDraggedWidth = self.draggedSize.width * self.scale
                                    if (newDraggedWidth > offsetWidth) {
                                        self.draggedSize = CGSize(width: offsetWidth / self.scale, height: value.translation.height + self.previousDragged.height)
                                    } else if (newDraggedWidth < -offsetWidth) {
                                        self.draggedSize = CGSize(width: -offsetWidth / self.scale, height: value.translation.height + self.previousDragged.height)
                                    } else {
                                        self.draggedSize = CGSize(width: value.translation.width + self.previousDragged.width, height: value.translation.height + self.previousDragged.height)
                                    }
                                    self.previousDragged = self.draggedSize
                                    }))).gesture(MagnificationGesture().onChanged({ (scale) in
                                    self.scale = scale.magnitude
                                }).onEnded({ (scaleFinal) in
                                    self.scale = scaleFinal.magnitude
                                }))
                    
                    Spacer()
                    }
                }
                    
                else if (self.value == 1) {
                   
                    HStack {
                        Spacer()
                        Image(uiImage: (UIImage(data: (self.entry.sideImg ?? UIImage(systemName: "person")?.pngData())!)!))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(12)
                    .animation(.default).offset(x: self.draggedSize2.width, y: 0).scaleEffect(self.scale2).scaleEffect(self.isTapped2 ? 2 : 1, anchor: UnitPoint(x: self.pointTapped2.x / reader.frame(in: .global).maxX, y: self.pointTapped2.y / reader.frame(in: .global).maxY)).gesture(TapGesture(count: 2).onEnded({
                                self.isTapped2 = !self.isTapped2
                            }).simultaneously(with: DragGesture(minimumDistance: 0, coordinateSpace: .global).onChanged({ (value) in
                                self.pointTapped2 = value.startLocation
                                self.draggedSize2 = CGSize(width: value.translation.width + self.previousDragged2.width, height: value.translation.height + self.previousDragged2.height)
                    //            print(value.startLocation)
                            }).onEnded({ (value) in
                    //            print(value.location)
                                let offsetWidth = (reader.frame(in: .global).maxX * self.scale2 - reader.frame(in: .global).maxX) / 2
                                let newDraggedWidth = self.draggedSize2.width * self.scale2
                                if (newDraggedWidth > offsetWidth) {
                                    self.draggedSize2 = CGSize(width: offsetWidth / self.scale2, height: value.translation.height + self.previousDragged2.height)
                                } else if (newDraggedWidth < -offsetWidth) {
                                    self.draggedSize2 = CGSize(width: -offsetWidth / self.scale2, height: value.translation.height + self.previousDragged2.height)
                                } else {
                                    self.draggedSize2 = CGSize(width: value.translation.width + self.previousDragged2.width, height: value.translation.height + self.previousDragged2.height)
                                }
                                self.previousDragged2 = self.draggedSize2
                                }))).gesture(MagnificationGesture().onChanged({ (scale2) in
                                self.scale2 = scale2.magnitude
                            }).onEnded({ (scale2Final) in
                                self.scale2 = scale2Final.magnitude
                            }))
                        
                        Spacer()
                    }
 
                    
                }

                    
                else {
                    
                    HStack {
                        Spacer()
                        Image(uiImage: (UIImage(data: (self.entry.backImg ?? UIImage(systemName: "person")?.pngData())!)!))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(12)
                    .animation(.default).offset(x: self.draggedSize.width, y: 0).scaleEffect(self.scale3).scaleEffect(self.isTapped3 ? 2 : 1, anchor: UnitPoint(x: self.pointTapped3.x / reader.frame(in: .global).maxX, y: self.pointTapped3.y / reader.frame(in: .global).maxY)).gesture(TapGesture(count: 2).onEnded({
                                self.isTapped3 = !self.isTapped3
                            }).simultaneously(with: DragGesture(minimumDistance: 0, coordinateSpace: .global).onChanged({ (value) in
                                self.pointTapped3 = value.startLocation
                                self.draggedSize3 = CGSize(width: value.translation.width + self.previousDragged3.width, height: value.translation.height + self.previousDragged3.height)
                    //            print(value.startLocation)
                            }).onEnded({ (value) in
                    //            print(value.location)
                                let offsetWidth = (reader.frame(in: .global).maxX * self.scale3 - reader.frame(in: .global).maxX) / 2
                                let newDraggedWidth = self.draggedSize.width * self.scale3
                                if (newDraggedWidth > offsetWidth) {
                                    self.draggedSize = CGSize(width: offsetWidth / self.scale3, height: value.translation.height + self.previousDragged3.height)
                                } else if (newDraggedWidth < -offsetWidth) {
                                    self.draggedSize = CGSize(width: -offsetWidth / self.scale3, height: value.translation.height + self.previousDragged3.height)
                                } else {
                                    self.draggedSize = CGSize(width: value.translation.width + self.previousDragged3.width, height: value.translation.height + self.previousDragged3.height)
                                }
                                self.previousDragged3 = self.draggedSize
                                }))).gesture(MagnificationGesture().onChanged({ (scale3) in
                                self.scale3 = scale3.magnitude
                            }).onEnded({ (scale3Final) in
                                self.scale3 = scale3Final.magnitude
                            }))
                        Spacer()
                    }
 
                }

            }
        }
    }
}





extension UIImage {
    func fixOrientation() -> UIImage {
        if self.imageOrientation == UIImage.Orientation.up {
            return self
        }
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        if let normalizedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return normalizedImage
        } else {
            return self
        }
    }
}




struct EntryInfoView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
