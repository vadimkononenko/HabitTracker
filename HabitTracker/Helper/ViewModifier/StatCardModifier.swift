//
//  StatCardModifier.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 06.03.2025.
//

import SwiftUI

struct StatCardModifier: ViewModifier {
    
    var red: Double
    var green: Double
    var blue: Double
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(Color.white)
            .cornerRadius(10)
            .foregroundColor(
                Color(
                    red: red,
                    green: green,
                    blue: blue
                )
            )
    }
}
