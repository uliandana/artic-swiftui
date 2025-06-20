//
//  PlaceholderImage.swift
//  artic-swiftui
//
//  Created by oka_uliandana on 17/06/25.
//

import SwiftUI

struct PlaceholderImage: View {
    var size: CGFloat
    var body: some View {
        Rectangle()
            .frame(width: size, height: size)
            .foregroundStyle(Constants.colorGrey)
    }
}

#Preview {
    PlaceholderImage(size: 200)
}
