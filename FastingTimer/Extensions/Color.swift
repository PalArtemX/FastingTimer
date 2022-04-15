//
//  Color.swift
//  FastingTimer
//
//  Created by Artem Paliutin on 15/04/2022.
//

import Foundation
import SwiftUI


struct ColorTheme {
    let background = Color("Background")
    let progressRing = Color("ProgressRing")
}


extension Color {
    static var colorTheme = ColorTheme()
}
