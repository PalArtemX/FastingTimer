//
//  FastingPlan.swift
//  FastingTimer
//
//  Created by Artem Paliutin on 15/04/2022.
//

import Foundation


enum FastingPlan: String {
    case beginner = "12:12"
    case intermediate = "16:8"
    case advanced = "20:4"
    
    var fastingPeriod: Double {
        switch self {
        case .beginner:
            return 12
        case .intermediate:
            return 16
        case .advanced:
            return 20
        }
    }
}
