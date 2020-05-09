//
//  EntryListViewModel.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/6/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import CoreData

class EntryListViewModel: ObservableObject {
    
    @Published
    var entries = [EntryViewModel]()
    
    init () {
        fetchAllEntries()
    }
    
    func fetchAllEntries() {
        self.entries = CoreDataManager.shared.getAllEntries().map(EntryViewModel.init)
        print(self.entries)
    }
    
    func deleteEntry(entryVM: EntryViewModel) {
        CoreDataManager.shared.deleteEntry(weight: entryVM.weight)
        fetchAllEntries()
    }
}

class EntryViewModel {
    var date = Date()
    var weight = ""
    
    init(entry: Entry) {
        self.date = entry.date!
        self.weight = entry.weight!
    }
}


