//
//  HabitCreateView.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 26.11.2024.
//

import SwiftUI

struct HabitCreateView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var viewModel: HabitsViewModel
    
    @State private var habitTitleTextField: String = ""
    @State private var habitMotivationQuoteTextField: String = ""
    @State private var habitColor: Color = Color.blue
    @State private var habitFrequency: HabitFrequency = .everyDay
    @State private var customFrequency: Int = 1
    @State private var isShowingAlert: Bool = false
    
    var body: some View {
        ZStack {
            habitColor
                .ignoresSafeArea()
            
            Form {
                Section("Title") {
                    ColorPicker(selection: $habitColor, supportsOpacity: true) {
                        TextField("Study programming", text: $habitTitleTextField)
                    }
                }
                
                Section("Motivation quote") {
                    TextField("Study programming", text: $habitMotivationQuoteTextField)
                }
                
                Section("Frequency") {
                    Picker("Repeating", selection: $habitFrequency) {
                        ForEach(HabitFrequency.allCases) {
                            Text($0.description)
                        }
                    }
                }
                
                Button("Create habit") {
                    createNewHabit()
                }
                .frame(maxWidth: .infinity)
            }
        }
        .alert(isPresented: $isShowingAlert) {
            Alert(
                title: Text("Incomplete Form"),
                message: Text("Please fill in all required fields to create a new habit"),
                dismissButton: .default(Text("Got it!"))
            )
        }
    }
}

extension HabitCreateView {
    
    func validateFields() -> Bool {
        !habitTitleTextField.isEmpty && !habitMotivationQuoteTextField.isEmpty
    }
    
    func createNewHabit() {
        if validateFields() {
            viewModel.createHabit(title: habitTitleTextField,
                                  motivationQuote: habitMotivationQuoteTextField,
                                  frequency: habitFrequency,
                                  r: habitColor.components.r,
                                  g: habitColor.components.g,
                                  b: habitColor.components.b)
            
            dismiss()
        } else {
            isShowingAlert = true
        }
    }
}

#Preview {
    HabitCreateView()
        .environmentObject(HabitsViewModel(coreDataManager: CoreDataManager.shared))
}
