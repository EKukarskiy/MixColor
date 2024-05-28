//
//  Model.swift
//  MixColor
//
//  Created by Evgeniy K on 23.05.2024.
//

import Foundation
import SwiftUI

// MARK: - View Model

final class ModelColors: ObservableObject {

    @Published var selectColor1: Color = .green
    @Published var selectColor2: Color = .green
    @Published var resultColor: Color = .green

    let colors: [Color] = [.red, .green, .orange, .blue, .cyan, .brown, .yellow, .gray, .indigo, .mint, .pink, .purple, .teal, .black, .white]

    // Mix color function
    func mixColors(_ color1: Color, _ color2: Color) -> Color {

        // Components color1
        var red1: CGFloat = 0
        var green1: CGFloat = 0
        var blue1: CGFloat = 0
        var alpha1: CGFloat = 0
        UIColor(color1).getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)

        // Components color2
        var red2: CGFloat = 0
        var green2: CGFloat = 0
        var blue2: CGFloat = 0
        var alpha2: CGFloat = 0
        UIColor(color2).getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)

        // Mix color
        let mixedRed = (red1 + red2) / 2
        let mixedGreen = (green1 + green2) / 2
        let mixedBlue = (blue1 + blue2) / 2
        let mixedAlpha = (alpha1 + alpha2) / 2

        return Color(red: Double(mixedRed), green: Double(mixedGreen), blue: Double(mixedBlue), opacity: Double(mixedAlpha))
    }
}
