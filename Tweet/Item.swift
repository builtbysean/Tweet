//
//  Item.swift
//  Tweet
//
//  Created by Sean Coffin on 10/3/25.
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
