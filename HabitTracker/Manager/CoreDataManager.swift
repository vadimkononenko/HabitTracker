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
    
    func persist(in context: NSManagedObjectContext) throws {
        if context.hasChanges {
            try context.save()
        }
    }
}
