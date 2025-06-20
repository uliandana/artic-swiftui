//
//  ArtDetailView.swift
//  artic-swiftui
//
//  Created by oka_uliandana on 02/05/25.
//

import SwiftUI
import SwiftData

struct ArtDetailView: View {
    @Environment(\.modelContext) private var context
    var artwork: Artwork
    var image: Image
    @State private var queryId: Int?
    private var isSaved: Bool {
        queryId == artwork.id
    }
    
    private func saveAction() {
        let savedArtwork = SavedArtwork(artwork: artwork)
        context.insert(savedArtwork)
        fetchSaved()
    }
    
    private func fetchSaved() {
        guard let filterId = artwork.id else { return }
        let descriptor = FetchDescriptor<SavedArtwork>(
            predicate: #Predicate{ $0.id == filterId }
        )
        do {
            queryId = try context.fetch(descriptor).first?.id ?? 0
        } catch {
            queryId = 0
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 393, height: 393)
                        .clipped()
                    VStack(spacing: 16) {
                        HStack(alignment: .center) {
                            Text("Credit: \(artwork.credit ?? "")")
                                .size12()
                                .foregroundStyle(Constants.colorGrey)
                            Spacer()
                            ArtDetailSaveButton(action: saveAction, disabled: isSaved)
                        }
                        
                        ArtDetailInfoView(title: "Description", info: artwork.description)
                        
                        ArtDetailInfoView(title: "Provenance Text", info: artwork.provenance)
                        
                        ArtDetailInfoView(title: "Publication History", info: artwork.publicationHistory)
                        
                        ArtDetailInfoView(title: "Exhibition History", info: artwork.exhibitionHistory)
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
        .navigationTitle(artwork.title ?? "")
        .onAppear {
            fetchSaved()
        }
    }
}

struct ArtDetailSaveButton: View {
    var action: () -> Void
    var disabled: Bool

    var body: some View {
        Button(disabled ? "Saved!" : "Save", action: action)
        .font(.system(size: 14, weight: .semibold))
        .foregroundStyle(.white)
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
        .background(
            disabled ? Constants.colorDisabled : Constants.colorMain
        )
        .clipShape(Capsule())
        .disabled(disabled)
    }
}

struct ArtDetailInfoView: View {
    var title: String
    var info: String?
    
    var body: some View {
        if let info = info {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .size12()
                    .bold()
                Text(info)
                    .size12()
                    .foregroundStyle(Constants.colorGrey)
            }.frame(maxWidth: .infinity)
        }
    }
}
