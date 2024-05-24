//
//  Plus.swift
//  MixColor
//
//  Created by Evgeniy K on 23.05.2024.
//

import SwiftUI

struct Plus: View {

    enum PlusConstants {
        static let imageWidth: CGFloat = 25
        static let imageHeight: CGFloat = 25
    }

    var body: some View {
        Image(systemName: "plus")
            .resizable()
            .frame(width: PlusConstants.imageWidth, height: PlusConstants.imageHeight)
            .padding()
    }
}

#Preview {
    Plus()
}
