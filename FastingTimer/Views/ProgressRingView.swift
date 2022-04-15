//
//  ProgressRingView.swift
//  FastingTimer
//
//  Created by Artem Paliutin on 15/04/2022.
//

import SwiftUI

struct ProgressRingView: View {
    @EnvironmentObject var fastingVM: FastingViewModel
    
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            // MARK: - Placeholder Ring
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.colorTheme.progressRing)
                .opacity(0.1)
            
            // MARK: - Colored Ring
            Circle()
                .trim(from: 0.0, to: min(fastingVM.progress, 1.0))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(.colorTheme.progressRing)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 2.0), value: fastingVM.progress)
            
            // MARK: Timer
            VStack(spacing: 20.0) {
                if fastingVM.fastingState == .notStarted {
                    // MARK: - Upcoming Time
                    VStack {
                        Text("Upcoming fast")
                            .font(.headline)
                            .opacity(0.6)
                        
                        Text("\(fastingVM.fastingPlan.fastingPeriod.formatted()) Hours")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                } else {
                    // MARK: - Elapsed Time
                    VStack {
                        Text("Elapsed Time (\(fastingVM.progress.formatted(.percent)))")
                            .font(.headline)
                            .opacity(0.6)
                        
                        Text(fastingVM.startTime, style: .timer)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    // MARK: - Remaining Time
                    VStack {
                        if !fastingVM.elapsed {
                            Text("Remaining Time (\((1 - fastingVM.progress).formatted(.percent)))")
                                .font(.subheadline)
                                .opacity(0.6)
                        } else {
                            Text("Extra Time")
                                .foregroundColor(.red)
                                .font(.subheadline)
                                .opacity(0.6)
                        }
                        Text(fastingVM.endTime, style: .timer)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                }
            }
            .foregroundColor(.white)
            
        }
        .frame(width: 250, height: 250)
        .padding()
        .onReceive(timer) { _ in
            fastingVM.track()
        }
    }
}










struct ProgressRingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProgressRingView()
                .environmentObject(FastingViewModel())
                .previewLayout(.sizeThatFits)
            ProgressRingView()
                .environmentObject(FastingViewModel())
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
        .background(Color.colorTheme.background)
    }
}
