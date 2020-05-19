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
        CoreDataManager.shared.deleteEntry(id: entryVM.id)
        fetchAllEntries()
    }
    
    func fetchFirstEntry() -> String {
        return CoreDataManager.shared.getAllEntries().last?.weight ?? "0.00"
    }
    
    func fetchLastEntry() -> String {
       return CoreDataManager.shared.getAllEntries().first?.weight ?? "0.00"
    }
}

class EntryViewModel {
    var date = Date()
    var weight = ""
    var frontImg = UIImage(systemName: "person")?.pngData()
    var sideImg = UIImage(systemName: "person")?.pngData()
    var backImg = UIImage(systemName: "person")?.pngData()
    var id = UUID()
    
    init(entry: Entry) {
        self.date = entry.date!
        self.weight = entry.weight!
        self.frontImg = entry.frontImg
        self.sideImg = entry.sideImg
        self.backImg = entry.backImg
        self.id = entry.id ?? UUID()
    }
}


