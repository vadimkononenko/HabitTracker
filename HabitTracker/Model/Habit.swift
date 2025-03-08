//
//  Habit.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 15.11.2024.
//

import Foundation
import CoreData

final class Habit: NSManagedObject, Identifiable {
    
    @NSManaged var id: UUID
    @NSManaged var title: String
    @NSManaged var motivationQuote: String
    @NSManaged var colorR: Double
    @NSManaged var colorG: Double
    @NSManaged var colorB: Double
    @NSManaged var startDate: Date
    @NSManaged var streak: Int
    @NSManaged var longestStreak: Int
    @NSManaged var isArchived: Bool
    @NSManaged var frequency: Int
    @NSManaged var records: Set<HabitRecord>
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        setPrimitiveValue(Date.now, forKey: "startDate")
        setPrimitiveValue(false, forKey: "isArchived")
        setPrimitiveValue(0, forKey: "longestStreak")
        setPrimitiveValue(0, forKey: "streak")
    }
}

extension Habit {
    
    private static var habitsFetchRequest: NSFetchRequest<Habit> {
        NSFetchRequest(entityName: "Habit")
    }
    
    static func allHabits() -> NSFetchRequest<Habit> {
        let request: NSFetchRequest<Habit> = habitsFetchRequest
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Habit.startDate, ascending: true)
        ]
        
        return request
    }
}
