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

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(items) { item in
                    let url = URL(string: "https://www.artic.edu/iiif/2/\(item.imageId ?? "")/full/843,/0/default.jpg")
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            PlaceholderImage(size: 118)
                        case .failure:
                            PlaceholderImage(size: 118)
                        case .success(let image):
                            NavigationLink {
                                ArtDetailView(artwork: item, image: image)
                            } label: {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 118, height: 118)
                                    .clipped()
                            }
                        @unknown default:
                            PlaceholderImage(size: 118)
                        }
                    }
                }
            }
        }
    }
}
