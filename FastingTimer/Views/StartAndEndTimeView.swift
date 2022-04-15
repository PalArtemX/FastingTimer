//
//  StartAndEndTimeView.swift
//  FastingTimer
//
//  Created by Artem Paliutin on 15/04/2022.
//

import SwiftUI

struct StartAndEndTimeView: View {
    var body: some View {
        HStack(spacing: 60.0) {
            // MARK: - Start Time
            VStack {
                Text("Start")
                    .opacity(0.7)
                Text(Date(), format: .dateTime.weekday().hour().minute().second())
                    .bold()
            }
            // MARK: - End Time
            VStack {
                Text("End")
                    .opacity(0.7)
                Text(Date().addingTimeInterval(16), format: .dateTime.weekday().hour().minute().second())
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
                .previewLayout(.sizeThatFits)
            StartAndEndTimeView()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
        .background(Color.colorTheme.background)
    }
}
