//
//  AllHabitsCompletionView.swift
//  HabitTracker
//
//  Created by Vadim Kononenko on 27.11.2024.
//

import SwiftUI

struct AllHabitsCompletionView: View {
    
    @EnvironmentObject private var allHabitsCompletionViewModel: AllHabitsCompletionViewModel
    
    var body: some View {
        VStack {
            streakView()
            allDatesView()
        }
        .frame(maxWidth: .infinity)
    }
}

extension AllHabitsCompletionView {
    
    @ViewBuilder
    func streakView() -> some View {
        VStack(alignment: .center) {
            Text("3")
                .font(.system(size: 26, weight: .bold))
            
            Text("Days streak")
                .font(.system(size: 16))
        }
    }
    
    @ViewBuilder
    func allDatesView() -> some View {
        GeometryReader { geometry in
            let itemCount = max(allHabitsCompletionViewModel.dates.count, 1)
            let spacing: CGFloat = 16
            let totalSpacing = spacing * CGFloat(itemCount - 1)
            let itemSize = max((geometry.size.width - totalSpacing) / CGFloat(itemCount), 0)
            
            HStack(spacing: spacing) {
                ForEach(allHabitsCompletionViewModel.dates, id: \.self) { date in
                    dateView(date: date, itemSize: itemSize)
                }
            }
        }
        .frame(height: 40)
    }
    
    @ViewBuilder
    func dateView(date: Date, itemSize: CGFloat) -> some View {
        Text("\(date.formattedDay())")
            .font(.system(size: 14, weight: .light))
            .foregroundColor(.white)
            .frame(width: itemSize, height: itemSize)
            .background(Color.green)
            .cornerRadius(5)
    }
}

#Preview {
    AllHabitsCompletionView()
}
