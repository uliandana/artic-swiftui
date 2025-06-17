//
//  HomeViewModel.swift
//  artic-swiftui
//
//  Created by oka_uliandana on 24/04/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var items: [Artwork] = []
    var search: String = ""
    
    func fetchArtworks() async {
        let queryFields = "fields=id,title,image_id,short_description,credit_line,provenance_text,publication_history,exhibition_history"
        guard let url = URL(string: "https://api.artic.edu/api/v1/artworks?page=15&limit=50&\(queryFields)") else { return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(GetArtworks.self, from: data)
            await MainActor.run {
                items = response.data ?? []
            }
        } catch {
            return
        }
    }
}
