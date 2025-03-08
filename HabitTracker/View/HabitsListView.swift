//
//  HabitsListView.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 27.11.2024.
//

import SwiftUI

struct HabitsListView: View {
    
    @EnvironmentObject var viewModel: HabitsViewModel
    
    var body: some View {
        if viewModel.habits.count > 0 {
            ScrollView {
                
                ForEach(viewModel.habits) { habit in
                    HabitItemView(habit: habit)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 8)
                        .padding(.top, 8)
                        .background(Color(red: habit.colorR, green: habit.colorG, blue: habit.colorB).opacity(0.6))
                        .cornerRadius(10)
                }
                
            }
            .scrollIndicators(.never)
        } else {
            HabitsNoContent()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
