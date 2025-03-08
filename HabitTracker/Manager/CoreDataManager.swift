//
//  CoreDataManager.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 15.11.2024.
//

import Foundation
import CoreData

final class CoreDataManager {
    
    static let shared: CoreDataManager = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "HabitTracker")
        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
        persistentContainer.loadPersistentStores { _, error in
            if let error {
                fatalError("Unable to load store with error: \(error)")
            }
        }
    }
    
    func save() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    // Preview Helper
    static func preview() -> CoreDataManager {
        let manager = CoreDataManager()
        
        let habit = Habit(context: manager.viewContext)
        habit.id = UUID()
        habit.title = "Don't eat after 6 p.m."
        
        manager.save()
        
        return manager
    }
}
