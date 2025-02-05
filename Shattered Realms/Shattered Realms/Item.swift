//
//  Item.swift
//  Shattered Realms
//
//  Created by Orkhan Gojayev on 10/2/24.
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
