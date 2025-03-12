//
//  HabitFrequency.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 26.11.2024.
//

import Foundation

enum HabitFrequency: Int, CaseIterable, Identifiable, CustomStringConvertible {
    
    var id: Self { self }
    case everyDay = 1
    case everyTwoDays = 2
    case everyWeek = 7
    
    var description: String {
        switch self {
        case .everyDay:
            return "Every Day"
        case .everyTwoDays:
            return "Every 2 Days"
        case .everyWeek:
            return "Every Week"
        }
    }
}
