//
//  Artwork.swift
//  artic-swiftui
//
//  Created by oka_uliandana on 23/04/25.
//

import Foundation
import SwiftData

@Model
final class SavedArtwork {
    var id: Int
    var title: String
    var imageId: String
    var bodyText: String
    
    init (artwork: Artwork) {
        self.id = artwork.id ?? 0
        self.title = artwork.title ?? ""
        self.imageId = artwork.imageId ?? ""
        self.bodyText = artwork.description ?? ""
    }
}

struct Artwork: Codable, Identifiable {
    let id: Int?
    let title: String?
    let imageId: String?
    let description: String?
    let credit: String?
    let provenance: String?
    let publicationHistory: String?
    let exhibitionHistory: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case imageId = "image_id"
        case description = "short_description"
        case credit = "credit_line"
        case provenance = "provenance_text"
        case publicationHistory = "publication_history"
        case exhibitionHistory = "exhibition_history"
    }
}
