//
//  StartAndEndTimeView.swift
//  FastingTimer
//
//  Created by Artem Paliutin on 15/04/2022.
//

import SwiftUI

struct StartAndEndTimeView: View {
    @EnvironmentObject var fastingVM: FastingViewModel
    
    var body: some View {
        HStack(spacing: 60.0) {
            // MARK: - Start Time
            VStack {
                Text(fastingVM.fastingState == .notStarted ? "Start" : "Started")
                    .opacity(0.7)
                Text(fastingVM.startTime, format: .dateTime.weekday().hour().minute().second())
                    .bold()
            }
            // MARK: - End Time
            VStack {
                Text(fastingVM.fastingState == .notStarted ? "End" : "Ends")
                    .opacity(0.7)
                Text(fastingVM.endTime, format: .dateTime.weekday().hour().minute().second())
                    .bold()
            }
        }
        .foregroundColor(.white)
    }
}










struct StartAndEndTimeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StartAndEndTimeView()
                .environmentObject(FastingViewModel())
                .previewLayout(.sizeThatFits)
            StartAndEndTimeView()
                .environmentObject(FastingViewModel())
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
        .background(Color.colorTheme.background)
    }
}
