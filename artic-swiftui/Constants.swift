//
//  Constants.swift
//  tukang-bakso-app
//
//  Created by oka_uliandana on 22/02/25.
//

import SwiftUI

struct Constants {
    static let colorMain = Color(hex: "#A20000")
    static let colorGrey = Color(hex: "#69707E")
    static let colorDisabled = Color(hex: "#CBCBCB")
}

struct Config {
    static let typography = "PlayfairDisplay-Regular"
    static func imageUrl(imageId: String) -> URL? {
        return URL(string: "https://www.artic.edu/iiif/2/\(imageId)/full/843,/0/default.jpg")
    }
}
