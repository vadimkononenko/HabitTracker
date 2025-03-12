//
//  HabitsView.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 15.11.2024.
//

import SwiftUI

struct HabitsView: View {
    
    @EnvironmentObject var viewModel: HabitsViewModel
    
    @State private var isShowCreatingHabitView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                AllHabitsCompletionView()
                
                HabitsListView()
            }
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowCreatingHabitView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowCreatingHabitView) {
                HabitCreateView()
            }
        }
    }
}
