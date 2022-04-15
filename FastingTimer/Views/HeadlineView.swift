//
//  HeadlineView.swift
//  FastingTimer
//
//  Created by Artem Paliutin on 15/04/2022.
//

import SwiftUI

struct HeadlineView: View {
    var body: some View {
        VStack {
            // MARK: - Title
            Text("Let's get started!")
                .font(.headline)
                .foregroundColor(.white)
            
            // MARK: - Fasting Plan
            HStack {
                Image(systemName: "timer")
                    .symbolRenderingMode(.hierarchical)
                Text("16:8")
                    .fontWeight(.bold)
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(.ultraThinMaterial)
            .cornerRadius(15)
        }
    }
}










struct HeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeadlineView()
                .previewLayout(.sizeThatFits)
            HeadlineView()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
        .background(Color.colorTheme.background)
    }
}
