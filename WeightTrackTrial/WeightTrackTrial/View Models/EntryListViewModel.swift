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
    }
    
    func deleteEntry(entryVM: EntryViewModel) {
        CoreDataManager.shared.deleteEntry(id: entryVM.id)
        fetchAllEntries()
    }
    
    func fetchFirstEntry() -> String {
       //return String(format: "%.1f",  ((CoreDataManager.shared.getAllEntries().last?.weight ?? "0.0") as NSString).doubleValue)
       //fetchAllEntries()
       return String(format: "%.1f",  ((entries.last?.weight ?? "0.0") as NSString).doubleValue)
    }
    
    func fetchLastEntry() -> String {
        //return String(format: "%.1f",  ((CoreDataManager.shared.getAllEntries().first?.weight ?? "0.0") as NSString).doubleValue)
        //fetchAllEntries()
        return String(format: "%.1f",  ((entries.first?.weight ?? "0.0") as NSString).doubleValue)
    }
    
    /*func changeWeight(index: Int) -> (String, Color, String) {
        
        //fetchAllEntries()
        let actualIndex: Int = abs(index - (entries.count-1))
        
        if (actualIndex == 0) {
            return ("0.0", .white, "")
        }
        else {
            let curWeight: Double = ((entries[actualIndex].weight) as NSString).doubleValue
            let prevWeight: Double = ((entries[actualIndex-1].weight) as NSString).doubleValue
            let weightLost: Double = prevWeight - curWeight
            
            if (weightLost == 0) {
                return (String(format: "%.1f",  abs(weightLost)), .white, "")
            }
            else if (weightLost > 0) {
                return (String(format: "%.1f",  abs(weightLost)), .green, "arrow.down")
            }
            else {
                return (String(format: "%.1f",  abs(weightLost)), .red, "arrow.up")
            }
        }
    }*/
    
    func changeWeight(index: Int) -> (String, Color, String) {
        
        //fetchAllEntries()
        //let actualIndex: Int = abs(index - (entries.count-1))
        
        if (entries.count == 0) {
            print("I reach a place I shouldn't")
            return ("error", .white, "")
        }
        
        else if (index == (entries.count-1)) { //the last one in the array
            return ("0.0", .white, "")
        }
        else {
            let curWeight: Double = ((entries[index].weight) as NSString).doubleValue
            let prevWeight: Double = ((entries[index+1].weight) as NSString).doubleValue
            let weightLost: Double = prevWeight - curWeight
            
            if (weightLost == 0) {
                return (String(format: "%.1f",  abs(weightLost)), .white, "")
            }
            else if (weightLost > 0) {
                return (String(format: "%.1f",  abs(weightLost)), .green, "arrow.down")
            }
            else {
                return (String(format: "%.1f",  abs(weightLost)), .red, "arrow.up")
            }
        }
    }
    
    func changeBeginWeight(index: Int) -> (String, Color, String) {
        
        //fetchAllEntries()
        //let actualIndex: Int = abs(index - (entries.count-1))
        
        if (entries.count == 0) {
            print("I reach a place I shouldn't")
            return ("error", .white, "")
        }
        
        else if (index == (entries.count-1)) { //the last one in the array
            return ("0.0", .white, "")
        }
        else {
            let curWeight: Double = ((entries[index].weight) as NSString).doubleValue
            let prevWeight: Double = ((entries[entries.count-1].weight) as NSString).doubleValue
            let weightLost: Double = prevWeight - curWeight
            
            if (weightLost == 0) {
                return (String(format: "%.1f",  abs(weightLost)), .white, "")
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
    
    
  /*  func changeBeginWeight(index: Int) -> (String, Color, String) {
        
        //fetchAllEntries()
        let actualIndex: Int = abs(index - (entries.count-1))
        
        if (actualIndex == 0) {
            return ("0.0", .white, "")
        }
        else {
            let curWeight: Double = ((entries[actualIndex].weight) as NSString).doubleValue
            let prevWeight: Double = ((entries.first!.weight) as NSString).doubleValue
            let weightLost: Double = prevWeight - curWeight
            
            if (weightLost == 0) {
                return (String(format: "%.1f",  abs(weightLost)), .white, "")
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
*/
    
class EntryViewModel {
    var date = Date()
    var weight = "0.0"
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


