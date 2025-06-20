//
//  BottomBar.swift
//  artic-swiftui
//
//  Created by oka_uliandana on 25/04/25.
//

import SwiftUI

struct BottomBar: View {
    var body: some View {
        HStack(alignment: .center) {
            NavigationLink {
                HomeView()
            } label: {
                VStack(alignment: .center) {
                    Image(systemName: "house.fill")
                        .foregroundStyle(Constants.colorMain)
                        .frame(width: 32, height: 32)
                    Text("Home")
                        .size12()
                        .foregroundStyle(Constants.colorMain)
                }
                .frame(width: 64, height: 64)
            }
            Spacer()
            NavigationLink {
                SavedView()
            } label: {
                VStack(alignment: .center) {
                    Image(systemName: "square.and.arrow.down.fill")
                        .foregroundStyle(Constants.colorMain)
                        .frame(width: 32, height: 32)
                    Text("Saved")
                        .size12()
                        .foregroundStyle(Constants.colorMain)
                }
                .frame(width: 64, height: 64)
            }
        }
        .padding(.horizontal, 64)
        .background(.clear)
    }
}

#Preview {
    BottomBar()
}
