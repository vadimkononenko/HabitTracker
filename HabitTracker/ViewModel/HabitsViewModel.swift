//
//  HabitsViewModel.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 26.11.2024.
//

import Foundation
import CoreData

class HabitsViewModel: ObservableObject {
    
    @Published var habits: [Habit] = []
    
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
        self.fetchHabits()
    }
    
    func fetchHabits() {
        let request = NSFetchRequest<Habit>(entityName: "Habit")
        
        do {
            habits = try coreDataManager.viewContext.fetch(request)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func createHabit(title: String,
                     motivationQuote: String,
                     frequency: HabitFrequency,
                     r: Double,
                     g: Double,
                     b: Double) {
        let habit = Habit(context: coreDataManager.viewContext)
        habit.id = UUID()
        habit.title = title
        habit.motivationQuote = motivationQuote
        habit.colorR = r
        habit.colorG = g
        habit.colorB = b
        habit.frequency = frequency.rawValue
        
        coreDataManager.save()
        
        fetchHabits()
    }
    
    func deleteAllHabits() {
        habits.forEach { habit in
            coreDataManager.viewContext.delete(habit)
        }
    }
    
    func isObjectAlreadyExist(id: UUID) -> Bool {
        let fetchRequest: NSFetchRequest<Habit> = Habit.allHabits()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id.uuidString)
        fetchRequest.fetchLimit = 1 // Ограничиваем результат одним объектом для оптимизации
        
        do {
            let count = try coreDataManager.viewContext.count(for: fetchRequest)
            return count > 0
        } catch {
            print("Error checking habit existence: \(error)")
            return false
        }
    }
}
