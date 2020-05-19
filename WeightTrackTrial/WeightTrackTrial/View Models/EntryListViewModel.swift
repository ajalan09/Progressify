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
        //print(self.entries)
    }
    
    func deleteEntry(entryVM: EntryViewModel) {
        CoreDataManager.shared.deleteEntry(id: entryVM.id)
        fetchAllEntries()
    }
    
    func fetchFirstEntry() -> String {
        return String(format: "%.1f",  ((CoreDataManager.shared.getAllEntries().last?.weight ?? "0.0") as NSString).doubleValue)
    }
    
    func fetchLastEntry() -> String {
        return String(format: "%.1f",  ((CoreDataManager.shared.getAllEntries().first?.weight ?? "0.0") as NSString).doubleValue)
    }
    
    func changeWeight(index: Int) -> (String, Color, String) {
        
        let actualIndex: Int = abs(index - (CoreDataManager.shared.sortEntries().count-1))
        
        if (actualIndex == 0) {
            return ("0.0", .white, "none")
        }
        else {
            let curWeight: Double = ((CoreDataManager.shared.sortEntries()[actualIndex].weight)! as NSString).doubleValue
            let prevWeight: Double = ((CoreDataManager.shared.sortEntries()[actualIndex-1].weight)! as NSString).doubleValue
            let weightLost: Double = prevWeight - curWeight
            
            if (weightLost == 0) {
                return (String(format: "%.1f",  abs(weightLost)), .white, "none")
            }
            else if (weightLost > 0) {
                return (String(format: "%.1f",  abs(weightLost)), .green, "arrow.down")
            }
            else {
                return (String(format: "%.1f",  abs(weightLost)), .red, "arrow.up")
            }
        }
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


