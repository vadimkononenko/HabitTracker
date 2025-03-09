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
                } 
            }
            .scrollIndicators(.never)
        } else {
            HabitsNoContent()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
