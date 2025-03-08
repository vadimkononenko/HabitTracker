//
//  HabitRecord.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 15.11.2024.
//

import Foundation
import CoreData

final class HabitRecord: NSManagedObject, Identifiable {
    
    @NSManaged var id: UUID
    @NSManaged var date: Date
    @NSManaged var isCompleted: Bool
    @NSManaged var habit: Habit
    
    var weekdayName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE"
        
        return dateFormatter.string(from: date)
    }
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        setPrimitiveValue(Date.now, forKey: "date")
        setPrimitiveValue(false, forKey: "isCompleted")
    }
}

extension HabitRecord {
    
    private static var habitRecordsFetchRequest: NSFetchRequest<HabitRecord> {
        NSFetchRequest(entityName: "HabitRecord")
    }
    
    static func allHabitRecords() -> NSFetchRequest<HabitRecord> {
        let request: NSFetchRequest<HabitRecord> = habitRecordsFetchRequest
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \HabitRecord.date, ascending: true)
        ]
        
        return request
    }
}
