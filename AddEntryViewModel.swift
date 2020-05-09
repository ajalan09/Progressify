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
    
    func saveEntry () {
        CoreDataManager.shared.saveEntry(date: self.date, weight: self.weight)
    }
}

