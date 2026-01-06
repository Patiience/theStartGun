//
//  GunSound.swift
//  The Start Gun
//
//  Created by Daniel Lu on 1/5/26.
//

import Foundation

enum GunSoundType: String, Codable {
    case onYourMarks
    case set
    case go
}

struct GunSound: Identifiable, Equatable, Codable {
    let id: UUID
    let type: GunSoundType
    let assetName: String   // name of audio file in Assets.xcassets

    init(type: GunSoundType, assetName: String) {
        self.id = UUID()
        self.type = type
        self.assetName = assetName
    }
}
