//
//  HabitItemView.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 27.11.2024.
//

import SwiftUI

struct HabitItemView: View {
    
    var habit: Habit
    
    var body: some View {
        HStack {
            VStack {
                dayHabitView()
                    .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 40)
                
                HStack {
                    streakView(streak: habit.streak,
                               streakTitle: "Current")
                    streakView(streak: habit.longestStreak,
                               streakTitle: "Best")
                    statsHabitView()
                }
                .frame(maxWidth: .infinity)
            }
            .padding(8)
            .background(Color(red: habit.colorR, green: habit.colorG, blue: habit.colorB).opacity(0.6))
            .cornerRadius(10)
            
            Button {
                //TODO: finish logic of set status done for habit
            } label: {
                Image(systemName: "checkmark")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
            }
            .frame(maxWidth: 40, maxHeight: .infinity)
            .padding(4)
            .background(Color(red: habit.colorR, green: habit.colorG, blue: habit.colorB).opacity(0.6))
            .cornerRadius(10)
        }
    }
    
    func getTodayFormattedDate() -> String {
        let todayDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        return dateFormatter.string(from: todayDate)
    }
}

extension HabitItemView {
    
    @ViewBuilder
    func dayHabitView() -> some View {
        Text(habit.title)
            .fontWeight(.bold)
            .foregroundColor(
                Color(
                    red: habit.colorR,
                    green: habit.colorG,
                    blue: habit.colorB
                )
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .cornerRadius(10)
    }
    
    @ViewBuilder
    func streakView(streak: Int, streakTitle: String) -> some View {
        HStack(alignment: .bottom) {
            Text("\(streak)")
                .font(.system(size: 14, weight: .bold))
        }
        .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 40)
        .streakCardStyle(red: habit.colorR, green: habit.colorG, blue: habit.colorB)
        .overlay(alignment: .top) {
            Text(streakTitle)
                .font(.system(size: 7, weight: .medium))
                .foregroundColor(.white)
                .padding(4)
                .background(.red)
                .cornerRadius(10)
                .offset(y: -10)
        }
    }
    
    @ViewBuilder
    func statsHabitView() -> some View {
        VStack {
            Text("Stats ->")
                .font(.system(size: 14, weight: .bold))
        }
        .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 40)
        .streakCardStyle(red: habit.colorR, green: habit.colorG, blue: habit.colorB)
    }
}
