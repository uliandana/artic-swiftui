//
//  SavedView.swift
//  artic-swiftui
//
//  Created by oka_uliandana on 28/04/25.
//

import SwiftUI
import SwiftData

struct SavedView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \SavedArtwork.id, order: .reverse) private var artworks: [SavedArtwork]
    private let imageSize = UIScreen.main.bounds.width - 32
    
    func onRemoveItem(_ item: SavedArtwork) {
        context.delete(item)
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(artworks) { item in
                        let url = URL(string: "https://www.artic.edu/iiif/2/\(item.imageId)/full/843,/0/default.jpg")
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                PlaceholderImage(size: imageSize)
                                    .foregroundStyle(.clear)
                                    .border(.gray, width: 1)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            case .failure:
                                PlaceholderImage(size: imageSize)
                                    .foregroundStyle(.clear)
                                    .border(.gray, width: 1)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            case .success(let image):
                                SavedItemView(image: image, data: item, onRemove: onRemoveItem)
                            @unknown default:
                                PlaceholderImage(size: imageSize)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
        }
    }
}

struct SavedItemView: View {
    var image: Image
    var data: SavedArtwork
    var onRemove: (_ item: SavedArtwork) -> Void
    private let imageSize = UIScreen.main.bounds.width - 32
    var body: some View {
        VStack(spacing: 8) {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: imageSize, height: imageSize)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .clipped()
            HStack(alignment: .bottom, spacing: 8) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(data.title)
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                    Text(data.bodyText)
                        .foregroundStyle(.gray)
                        .font(.system(size: 12))
                    Text("Score: 6.1")
                        .foregroundStyle(.gray)
                        .font(.system(size: 12))
                }
                Spacer()
                Image(systemName: "trash")
                    .foregroundStyle(.red)
                    .onTapGesture {
                        onRemove(data)
                    }
            }
        }
    }
}
