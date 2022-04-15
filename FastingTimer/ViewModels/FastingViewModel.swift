//
//  FastingViewModel.swift
//  FastingTimer
//
//  Created by Artem Paliutin on 15/04/2022.
//

import Foundation


class FastingViewModel: ObservableObject {
    @Published private(set) var fastingState: FastingState = .notStarted
    
    
}
