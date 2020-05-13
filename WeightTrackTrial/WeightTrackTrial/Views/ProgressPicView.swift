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
                .frame(width: 80, height: 80)
        
            Image(uiImage: (UIImage(data: (entry.sideImg ?? UIImage(systemName: "person")?.pngData())!)!))
                .resizable()
                .frame(width: 80, height: 80)
        
            Image(uiImage: (UIImage(data: (entry.backImg ?? UIImage(systemName: "person")?.pngData())!)!))
                .resizable()
                .frame(width: 80, height: 80)
        }
    }
}

/*struct ProgressPicView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressPicView(entry: EntryViewModel(entry: Entr))
    }
}*/
