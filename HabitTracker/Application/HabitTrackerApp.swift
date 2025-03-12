//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 15.11.2024.
//

import SwiftUI

@main
struct HabitTrackerApp: App {
    
    @StateObject private var habitsViewModel = HabitsViewModel(coreDataManager: CoreDataManager.shared)
    @StateObject private var allHabitsViewModel = AllHabitsCompletionViewModel()
    
    var body: some Scene {
        WindowGroup {
            HabitsView()
                .environmentObject(habitsViewModel)
                .environmentObject(allHabitsViewModel)
                .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
        }
    }
}
