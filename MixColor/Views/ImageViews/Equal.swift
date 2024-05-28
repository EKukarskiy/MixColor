//
//  Equal.swift
//  MixColor
//
//  Created by Evgeniy K on 23.05.2024.
//

import SwiftUI

struct Equal: View {

    enum EqualConstants {
        static let imageWidth: CGFloat = 20
        static let imageHeight: CGFloat = 20
    }

    var body: some View {
        Image(systemName: "equal")
            .resizable()
            .frame(width: EqualConstants.imageWidth, height: EqualConstants.imageHeight)
            .padding()
    }
}

#Preview {
    Equal()
}
