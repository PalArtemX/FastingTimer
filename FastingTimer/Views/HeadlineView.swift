//
//  HeadlineView.swift
//  FastingTimer
//
//  Created by Artem Paliutin on 15/04/2022.
//

import SwiftUI

struct HeadlineView: View {
    @EnvironmentObject var fastingVM: FastingViewModel
    
    var title: String {
        switch fastingVM.fastingState {
        case .notStarted:
            return "Let's get started!"
        case .fasting:
            return "You are now fasting"
        case .feeding:
            return "You are now feeding"
        }
    }
    
    var body: some View {
        VStack {
            // MARK: - Title
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            
            // MARK: - Fasting Plan
            HStack {
                Image(systemName: "calendar.day.timeline.left")
                    .symbolRenderingMode(.hierarchical)
                Text(fastingVM.fastingPlan.rawValue)
                    .fontWeight(.bold)
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(.ultraThinMaterial)
            .cornerRadius(15)
        }
    }
}










struct HeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeadlineView()
                .environmentObject(FastingViewModel())
                .previewLayout(.sizeThatFits)
            HeadlineView()
                .environmentObject(FastingViewModel())
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
        .background(Color.colorTheme.background)
    }
}
