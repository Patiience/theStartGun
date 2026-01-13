//
//  GunSound.swift
//  The Start Gun
//
//  Created by Daniel Lu on 1/5/26.
//

import Foundation

struct Sound: Identifiable, Equatable, Codable, Hashable {
    let id: UUID
    let displayName: String
    let assetName: String

    init(assetName: String, displayName: String) {
        self.id = UUID()
        self.displayName = displayName
        self.assetName = assetName
    }
}
