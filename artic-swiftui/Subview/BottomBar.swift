//
//  BottomBar.swift
//  artic-swiftui
//
//  Created by oka_uliandana on 25/04/25.
//

import SwiftUI

struct BottomBar: View {
    let mainColor: Color = Color(red: 162/255, green: 0, blue: 0)
    var body: some View {
        HStack(alignment: .center) {
            NavigationLink {
                HomeView()
            } label: {
                VStack(alignment: .center) {
                    Image(systemName: "house.fill")
                        .foregroundStyle(mainColor)
                        .frame(width: 32, height: 32)
                    Text("Home")
                        .foregroundStyle(mainColor)
                        .font(.custom("Poppins", size: 12))
                }
                .frame(width: 64, height: 64)
            }
            Spacer()
            NavigationLink {
                SavedView()
            } label: {
                VStack(alignment: .center) {
                    Image(systemName: "square.and.arrow.down.fill")
                        .foregroundStyle(mainColor)
                        .frame(width: 32, height: 32)
                    Text("Saved")
                        .foregroundStyle(mainColor)
                        .font(.custom("Poppins", size: 12))
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
