//
//  Item.swift
//  artic-swiftui
//
//  Created by oka_uliandana on 23/04/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
