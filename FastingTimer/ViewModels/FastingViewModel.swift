//
//  FastingViewModel.swift
//  FastingTimer
//
//  Created by Artem Paliutin on 15/04/2022.
//

import Foundation


class FastingViewModel: ObservableObject {
    @Published private(set) var fastingState: FastingState = .notStarted
    @Published private(set) var fastingPlan: FastingPlan = .intermediate
    @Published private(set) var elapsed: Bool = false
    @Published private(set) var endTime: Date
    @Published private(set) var elapsedTime: Double = 0.0
    @Published private(set) var progress: Double = 0.0
    
    @Published private(set) var startTime: Date {
        didSet {
            if fastingState == .fasting {
                endTime = startTime.addingTimeInterval(fastingTime)
            } else {
                endTime = startTime.addingTimeInterval(feedingTime)
            }
        }
    }
    
    var fastingTime: Double {
        return fastingPlan.fastingPeriod * 60 * 60
    }
    var feedingTime: Double {
        return 24 - (fastingPlan.fastingPeriod) * 60 * 60
    }
    
    
    
    // MARK: - init
    init() {
        let calendar = Calendar.current
        
//        var components = calendar.dateComponents([.year, .month, .day, .hour], from: Date())
//        components.hour = 20
//
//        let scheduledTime = calendar.date(from: components) ?? Date.now
        let components = DateComponents(hour: 20)
        let scheduledTime = calendar.nextDate(after: .now, matching: components, matchingPolicy: .nextTime)!
        
        startTime = scheduledTime
        endTime = scheduledTime.addingTimeInterval(FastingPlan.intermediate.fastingPeriod * 60 * 60)
    }
    
    
    // MARK: - Functions
    // MARK: toggleFastingState
    func toggleFastingState() {
        fastingState = fastingState == .fasting ? .feeding : .fasting
        startTime = Date()
        elapsedTime = 0.0
        
    }
    // MARK: track
    func track() {
        guard fastingState != .notStarted else { return }
        
        if endTime >= Date() {
            elapsed  = false
        } else {
            elapsed = true
        }
        
        elapsedTime += 1
        
        let totalTime = fastingState == .fasting ? fastingTime : feedingTime
        progress = (elapsedTime / totalTime * 100).rounded() / 100
    }
    
    
}
