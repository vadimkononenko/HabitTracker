//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 15.11.2024.
//

import SwiftUI

@main
struct HabitTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HabitsView()
                    .tabItem {
                        Label("Habits", systemImage: "calendar")
                    }
                
                HabitsProgressView()
                    .tabItem {
                        Label("Progress", systemImage: "chart.pie")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}
