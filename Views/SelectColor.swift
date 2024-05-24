//
//  SelectColor.swift
//  MixColor
//
//  Created by Evgeniy K on 23.05.2024.
//

import SwiftUI

// MARK: - Color view with a scrollable color variants

struct SelectColor: View {

    let modelColors: ModelColors
    @Binding var selectedColor: Color

    enum Constants {
        static let textOpacity: Double = 0.8

        static let rectCornerRadius: CGFloat = 20
        static let rectWidth: CGFloat = 80
        static let rectHeight: CGFloat = 80
        static let rectLineWidth: CGFloat = 4
        static let rectShadowRadius: CGFloat = 7

        static let scrollHStackSpacing: CGFloat = 7
        static let scrollRectCornerRadius: CGFloat = 10
        static let scrollRectWidth: CGFloat = 30
        static let scrollRectHeight: CGFloat = 30
        static let scrollOpacity1: Double = 1.0
        static let scrollOpacity2: Double = 0.6
        static let scrollScaleEffect1: Double = 1.3
        static let scrollScaleEffect2: Double = 1
        static let scrollRectLineWidth: CGFloat = 2
        static let scrollRectShadowRadius: CGFloat = 3
        static let scrollPadding: CGFloat = 5
        static let scrollHeight: CGFloat = 50
    }

    var body: some View {
        VStack {
            Text(selectedColor.description)
                .font(.title2)
                .fontWeight(.semibold)
                .textCase(.uppercase)
                .opacity(Constants.textOpacity)

            RoundedRectangle(cornerRadius: Constants.rectCornerRadius)
                .fill(selectedColor)
                .frame(width: Constants.rectWidth, height: Constants.rectHeight)
                .clipShape(.rect(cornerRadius: Constants.rectCornerRadius))
                .overlay(RoundedRectangle(cornerRadius: Constants.rectCornerRadius)
                    .stroke(.white, lineWidth: Constants.rectLineWidth))
                .shadow(radius: Constants.rectShadowRadius)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: Constants.scrollHStackSpacing) {
                    ForEach(modelColors.colors, id: \.self) { color in
                        RoundedRectangle(cornerRadius: Constants.scrollRectCornerRadius)
                            .fill(color)
                            .frame(width: Constants.scrollRectWidth, height: Constants.scrollRectHeight)
                            .opacity(color == selectedColor ? Constants.scrollOpacity1 : Constants.scrollOpacity2)
                            .scaleEffect(color == selectedColor ? Constants.scrollScaleEffect1 : Constants.scrollScaleEffect2)
                            .overlay(RoundedRectangle(cornerRadius: Constants.scrollRectCornerRadius)
                                .stroke(.white, lineWidth: Constants.scrollRectLineWidth))
                            .shadow(radius: Constants.scrollRectShadowRadius)
                            .onTapGesture {
                                selectedColor = color

                                // Call mix color function
                                let result = modelColors.mixColors(modelColors.selectColor1, modelColors.selectColor2)

                                // Pass new color to the Model
                                modelColors.resultColor = result
                            }
                    }
                    .padding(Constants.scrollPadding)
                    .frame(maxHeight: Constants.scrollHeight)
                }
            }
        }
    }
}

#Preview {
    SelectColor(modelColors: ModelColors(), selectedColor: .constant(.gray))
}
