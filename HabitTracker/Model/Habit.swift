//
//  Habit.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 15.11.2024.
//

import Foundation
import CoreData

final class Habit: NSManagedObject {
    
    @NSManaged var id: UUID
    @NSManaged var name: String
    @NSManaged var icon: String
    @NSManaged var startDate: Date
    @NSManaged var streak: Int
    @NSManaged var longestStreak: Int
    @NSManaged var isArchived: Bool
    @NSManaged var user: User
    @NSManaged var schedule: HabitSchedule
    @NSManaged var records: HabitRecord
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        setPrimitiveValue(Date.now, forKey: "startDate")
        setPrimitiveValue(false, forKey: "isArchived")
    }
}
