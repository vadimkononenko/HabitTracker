//
//  HabitsNoContent.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 27.11.2024.
//

import SwiftUI

struct HabitsNoContent: View {
    var body: some View {
        VStack {
            Text("👀 No Habits")
                .font(.largeTitle.bold())
            Text("It's seems a lil empty here create your habit!")
                .font(.callout)
        }
    }
}

#Preview {
    HabitsNoContent()
}
