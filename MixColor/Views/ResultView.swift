//
//  ResultView.swift
//  MixColor
//
//  Created by Evgeniy K on 23.05.2024.
//

import SwiftUI

// MARK: - View with the result of color mixing

struct ResultView: View {

    @Binding var resultColor: Color

    enum ResultConstants {
        static let textOpacity: Double = 0.8

        static let rectCornerRadius: CGFloat = 20
        static let rectWidth: CGFloat = 80
        static let rectHeight: CGFloat = 80
        static let rectLineWidth: CGFloat = 4
        static let rectShadowRadius: CGFloat = 7
    }

    var body: some View {
        Text(resultColor.description)
            .font(.title2)
            .fontWeight(.semibold)
            .textCase(.uppercase)
            .opacity(ResultConstants.textOpacity)

        RoundedRectangle(cornerRadius: ResultConstants.rectCornerRadius)
            .fill(resultColor)
            .frame(width: ResultConstants.rectWidth, height: ResultConstants.rectHeight)
            .clipShape(.rect(cornerRadius: ResultConstants.rectCornerRadius))
            .overlay(RoundedRectangle(cornerRadius: ResultConstants.rectCornerRadius)
                .stroke(.white, lineWidth: ResultConstants.rectLineWidth))
            .shadow(radius: ResultConstants.rectShadowRadius)
    }
}

#Preview {
    ResultView(resultColor: .constant(.green))
}
