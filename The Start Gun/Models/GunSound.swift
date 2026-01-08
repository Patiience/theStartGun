//
//  GunSound.swift
//  The Start Gun
//
//  Created by Daniel Lu on 1/5/26.
//

import Foundation

struct GunSound: Identifiable, Equatable, Codable, Hashable {
    let id: UUID
    let displayName: String
    let assetName: String   // name of audio file in Assets.xcassets

    init(assetName: String, displayName: String) {
        self.id = UUID()
        self.displayName = displayName
        self.assetName = assetName
    }
}
