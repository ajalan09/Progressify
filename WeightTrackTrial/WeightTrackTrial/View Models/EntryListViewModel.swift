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
    
    func fetchFirstEntry() -> String {
        return entries.first?.weight ?? "Unkown"
    }
    
    func fetchLastEntry() -> String {
        return entries.last?.weight ?? "Unkown"
    }
}

class EntryViewModel {
    var date = Date()
    var weight = ""
    var frontImg = UIImage(systemName: "person")?.pngData()
    var sideImg = UIImage(systemName: "person")?.pngData()
    var backImg = UIImage(systemName: "person")?.pngData()
    
    init(entry: Entry) {
        self.date = entry.date!
        self.weight = entry.weight!
        self.frontImg = entry.frontImg
        self.sideImg = entry.sideImg
        self.backImg = entry.backImg
    }
}


