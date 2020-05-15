//
//  ProgressPicView.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/13/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//

import SwiftUI

struct ProgressPicView: View {
    
   var entry: EntryViewModel
    
    var body: some View {
        VStack {

            Image(uiImage: (UIImage(data: (entry.frontImg ?? UIImage(systemName: "person")?.pngData())!)!))
                .resizable()
                .frame(width: 100, height: 100)
                
            
           Image(uiImage: (UIImage(data: (entry.sideImg ?? UIImage(systemName: "person")?.pngData())!)!))
               .resizable()
                .frame(width: 100, height: 100)
                
        
           Image(uiImage: (UIImage(data: (entry.backImg ?? UIImage(systemName: "person")?.pngData())!)!))
               .resizable()
                .frame(width: 100, height: 100)
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

