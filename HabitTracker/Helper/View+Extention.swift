//
//  View+Extention.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 06.03.2025.
//

import SwiftUI

extension View {
    func streakCardStyle(red: Double,
                         green: Double,
                         blue: Double) -> some View {
        modifier(StatCardModifier(red: red, green: green, blue: blue))
    }
}
