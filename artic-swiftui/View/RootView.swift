//
//  RootView.swift
//  artic-swiftui
//
//  Created by oka_uliandana on 28/04/25.
//

import SwiftUI

struct RootView: View {
    let mainColor: Color = Color(red: 162/255, green: 0, blue: 0)
    var body: some View {
        TabView() {
            Tab("Home", systemImage: "house.fill") {
                HomeView()
            }
            Tab("Saved", systemImage: "square.and.arrow.down.fill") {
                SavedView()
            }
        }
        .tint(mainColor)
        .onAppear {
            UITabBar.appearance().backgroundColor = .clear
            UITabBar.appearance().unselectedItemTintColor = .gray
        }
    }
}
