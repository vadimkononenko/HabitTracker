//
//  HabitSchedule.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 15.11.2024.
//

import Foundation
import CoreData

final class HabitSchedule: NSManagedObject {
    
    @NSManaged var id: UUID
    @NSManaged var frequency: Int
    @NSManaged var daysOfWeek: [Int]
    @NSManaged var habit: Habit
}
