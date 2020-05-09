//
//  CoreDataManager.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/6/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var moc: NSManagedObjectContext
    
    private init (moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    private func fetchEntry(weight: String) -> Entry? {
        var entries = [Entry]()
        
        let request: NSFetchRequest<Entry> = Entry.fetchRequest()
        request.predicate = NSPredicate(format: "weight == %@", weight)
        
        do {
            entries = try self.moc.fetch(request)
        } catch let error as NSError {
            print(error)
        }
        
        return entries.first
    }
    
    func deleteEntry(weight: String) {
        do {
            if let entry = fetchEntry(weight: weight) {
                self.moc.delete(entry)
                try self.moc.save()
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    func saveEntry(date: Date, weight: String) {
        
        let entry = Entry(context: self.moc)
        entry.date = date
        entry.weight = weight
        
        do {
            try self.moc.save()
        } catch let error as NSError {
            print (error)
        }
    }
    
    func getAllEntries() -> [Entry] {
        var entries = [Entry]()
        
        let entryRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        
        do {
            entries = try self.moc.fetch(entryRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return entries
    }
}
