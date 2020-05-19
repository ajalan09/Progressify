//
//  AddEntryViewModel.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/6/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//

import Foundation
import SwiftUI

class AddEntryViewModel {
    
    var date: Date = Date()
    var weight: String = ""
    var frontImg: UIImage = UIImage(systemName: "person")!
    var sideImg: UIImage = UIImage(systemName: "person")!
    var backImg: UIImage = UIImage(systemName: "person")!
    var id: UUID = UUID()

    func saveEntry () {
        CoreDataManager.shared.saveEntry(date: self.date, weight: self.weight, frontImg: self.frontImg, sideImg: self.sideImg, backImg: self.backImg, id: self.id)
    }
}

