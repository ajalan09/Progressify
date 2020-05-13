/*//
//  TempImageVoew.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/10/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//

import SwiftUI
import CoreData

struct TempImageView: View {
    
    @State private var showFrontImagePicker: Bool = false
    @State private var showSideImagePicker: Bool = false
    @State private var showBackImagePicker: Bool = false
    @State private var frontImage: UIImage?
    @State private var sideImage: UIImage?
    @State private var backImage: UIImage?
    
        var body: some View {
            
            ExtractedView()
        
    
    
    }
}

/*struct ChooseFrontImageView: View {
    
   
    
    var body: some View {
        Button("Choose Front Image") {
            
        }
    }
}*/


struct TempImageVoew_Previews: PreviewProvider {
    static var previews: some View {
        TempImageView()
    }
}

*/
