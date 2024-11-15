//
//  HabitRecord.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 15.11.2024.
//

import Foundation
import CoreData

final class HabitRecord: NSManagedObject {
    
    @NSManaged var id: UUID
    @NSManaged var date: Date
    @NSManaged var isCompleted: Bool
    @NSManaged var habit: Habit
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        setPrimitiveValue(Date.now, forKey: "date")
        setPrimitiveValue(false, forKey: "isCompleted")
    }
}
