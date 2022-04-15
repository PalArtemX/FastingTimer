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
    
    @Published private(set) var startTime: Date {
        didSet {
            if fastingState == .fasting {
                endTime = startTime.addingTimeInterval(fastingTime)
            } else {
                endTime = startTime.addingTimeInterval(feedingTime)
            }
        }
    }
    
    @Published private(set) var endTime: Date
    
    var fastingTime: Double {
        return fastingPlan.fastingPeriod
    }
    var feedingTime: Double {
        return 24 - fastingPlan.fastingPeriod
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
        endTime = scheduledTime.addingTimeInterval(FastingPlan.intermediate.fastingPeriod)
    }
    
    // MARK: - Functions
    
    // MARK:
    func toggleFastingState() {
        fastingState = fastingState == .fasting ? .feeding : .fasting
        startTime = Date()
        
    }
    
}
