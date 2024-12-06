//
//  Color+Extension.swift
//  SoberTasks
//
//  Created by Ch Burhan Ahmad on 12/5/24.
//

import SwiftUI

extension Color {
    // Creates a flat background gradient from the provided start and end colors
    static func flatBackground(startColor: Color, endColor: Color) -> LinearGradient {
        return LinearGradient(
            gradient: Gradient(colors: [startColor.opacity(0.1), endColor.opacity(0.1)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    // Primary accent color used throughout the app
    static let primaryAccent = Color.blue.opacity(0.7)
    // Secondary accent color used for buttons and highlights
    static let secondaryAccent = Color.purple.opacity(0.7)
}
