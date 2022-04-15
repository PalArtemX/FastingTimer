//
//  HomeView.swift
//  FastingTimer
//
//  Created by Artem Paliutin on 15/04/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var fastingVM: FastingViewModel
    
    var body: some View {
        ZStack {
            // MARK: - Background
            Color.colorTheme.background
                .ignoresSafeArea()
            
            VStack(spacing: 50) {
                // MARK: - Headline
                HeadlineView()
                
                // MARK: - ProgressRing
                ProgressRingView()
                
                // MARK: - Time Start and End
                StartAndEndTimeView()
                
                // MARK: - Button
                Button {
                    fastingVM.toggleFastingState()
                } label: {
                    // MARK: - Fasting Plan
                    HStack {
                        Image(systemName: fastingVM.fastingState == .fasting ? "stop.circle" : "play.circle")
                            .symbolRenderingMode(.hierarchical)
                        Text(fastingVM.fastingState == .fasting ? "End Fast" : "Start Fast")
                            .bold()
                    }
                    .font(.title3)
                    .padding(.horizontal)
                }
                .padding()
                .buttonStyle(.borderedProminent)
                
                
            }
        }
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(FastingViewModel())
    }
}
