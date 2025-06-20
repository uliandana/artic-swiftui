//
//  ContentView.swift
//  artic-swiftui
//
//  Created by oka_uliandana on 23/04/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    let mainColor: Color = Color(red: 162/255, green: 0, blue: 0)
    var body: some View {
        NavigationStack {
            VStack {
                TextField("placeholder", text: $viewModel.search)
                    .textSize12()
                    .padding(8)
                    .background(.white)
                    .border(mainColor, width: 1)
                    .autocorrectionDisabled()
                GridImage(items: viewModel.items)
                    .task {
                        await viewModel.fetchArtworks()
                    }
                Spacer().frame(height: 1)
            }
            .padding(.horizontal, 16)
        }
    }
}
