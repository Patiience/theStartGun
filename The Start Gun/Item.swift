//
//  Item.swift
//  The Start Gun
//
//  Created by Daniel Lu on 1/2/26.
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
