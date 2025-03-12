//
//  Date+Extantion.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 06.03.2025.
//

import Foundation

extension Date {
    
    func formattedDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter.string(from: self)
    }
}
