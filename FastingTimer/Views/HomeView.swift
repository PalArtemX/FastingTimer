//
//  HomeView.swift
//  FastingTimer
//
//  Created by Artem Paliutin on 15/04/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            // MARK: - Background
            Color.colorTheme.background
                .ignoresSafeArea()
            
            VStack {
                // MARK: - Headline
                HeadlineView()
                
                // MARK: - ProgressRing
                ProgressRingView()
                
                // MARK: - Start
                Text("Start")
                    .opacity(0.7)
                Text(Date(), format: .dateTime.weekday().hour().minute().second())
                
            }
            
        }
        .foregroundColor(.white)
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
