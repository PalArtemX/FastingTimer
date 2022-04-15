//
//  FastingTimerApp.swift
//  FastingTimer
//
//  Created by Artem Paliutin on 15/04/2022.
//

import SwiftUI

@main
struct FastingTimerApp: App {
    @StateObject var fastingVM = FastingViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(fastingVM)
        }
    }
}
