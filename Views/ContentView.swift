//
//  ContentView.swift
//  MixColor
//
//  Created by Evgeniy K on 22.05.2024.
//

import SwiftUI

// MARK: - Main screen view

struct ContentView: View {

    @ObservedObject var modelColors = ModelColors()

    var body: some View {
        NavigationStack {
            ScrollView {
                SelectColor(modelColors: modelColors, selectedColor: $modelColors.selectColor1)

                Plus()
                
                SelectColor(modelColors: modelColors, selectedColor: $modelColors.selectColor2)

                Equal()

                ResultView(resultColor: $modelColors.resultColor)

                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("MixColor")
        }
        .dynamicTypeSize(.xSmall ... .xxLarge)
    }
}

#Preview {
    ContentView()
}
