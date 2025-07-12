//
//  HomeGridImage.swift
//  artic-swiftui
//
//  Created by oka_uliandana on 24/04/25.
//

import SwiftUI

struct GridImage: View {
    var items: [Artwork]
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let imageSize = (UIScreen.main.bounds.width - 16) / 3
//    private let imageSize = 118

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(items) { item in
                    let url = Config.imageUrl(imageId: item.imageId ?? "")
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .success(let image):
                            NavigationLink {
                                ArtDetailView(artwork: item, image: image)
                            } label: {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: imageSize, height: imageSize)
                                    .clipped()
                            }
                        default:
                            PlaceholderImage(size: imageSize)
                        }
                    }
                }
            }
        }
    }
}
