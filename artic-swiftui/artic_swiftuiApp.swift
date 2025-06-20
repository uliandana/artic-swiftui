//
//  artic_swiftuiApp.swift
//  artic-swiftui
//
//  Created by oka_uliandana on 23/04/25.
//

import SwiftUI
import SwiftData

@main
struct artic_swiftuiApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            SavedArtwork.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.font, .custom("PlayfairDisplay-Regular", size: 16))
        }
        .modelContainer(sharedModelContainer)
    }
}
