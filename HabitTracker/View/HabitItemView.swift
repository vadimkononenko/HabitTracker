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
        VStack(alignment: .leading) {
            VStack {
                Text(habit.title)
                    .fontWeight(.bold)
                    .foregroundColor(
                        Color(
                            red: habit.colorR,
                            green: habit.colorG,
                            blue: habit.colorB
                        )
                    )
            }
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(.white)
            .cornerRadius(10)
            .padding(.top, 16)
            
            HStack {
                createStreakView(streak: habit.streak,
                                 streakTitle: "Current")
                createStreakView(streak: habit.longestStreak,
                                 streakTitle: "Best")
                createStatsHabitView()
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 8)
            .padding(.bottom, 16)
        }
        .padding(.horizontal, 8)
    }
}

extension HabitItemView {
    
    @ViewBuilder
    func createDayHabitView(habitRecord: HabitRecord) -> some View {
        VStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.green)
                .frame(width: 25, height: 25)
                .overlay {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
            
            Text("Fr")
                .font(.system(size: 14, weight: .light))
            
            Text("\(habitRecord.weekdayName)")
                .font(.system(size: 16, weight: .regular))
        }
    }
    
    @ViewBuilder
    func createStreakView(streak: Int, streakTitle: String) -> some View {
        HStack(alignment: .bottom) {
            Text("\(streak)")
                .font(.system(size: 15, weight: .bold))
        }
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
    func createStatsHabitView() -> some View {
        VStack {
            Text("Stats ->")
                .font(.system(size: 10, weight: .regular))
        }
        .streakCardStyle(red: habit.colorR, green: habit.colorG, blue: habit.colorB)
    }
}
