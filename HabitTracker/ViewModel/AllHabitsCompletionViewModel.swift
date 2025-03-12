//
//  AllHabitsCompletionViewModel.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 06.03.2025.
//

import Foundation

class AllHabitsCompletionViewModel: ObservableObject {
    
    @Published var dates: [Date] = []
    
    init() {
        dates = (-3...3).compactMap { Calendar.current.date(byAdding: .day, value: $0, to: Date()) }
    }
}
