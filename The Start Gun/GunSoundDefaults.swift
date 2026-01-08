//
//  GunSoundDefaults.swift
//  The Start Gun
//
//  Created by Daniel Lu on 1/6/26.
//

struct GunSoundDefaults {
    static let onYourMarks = GunSound(
        assetName: "on_your_marks",
        displayName: "On Your Marks!"
    )

    static let set = GunSound(
        assetName: "set",
        displayName: "set"
    )

    static let go = GunSound(
        assetName: "go",
        displayName: "go"
    )
    
    // User-selectable gun sounds
    static let gunSounds: [GunSound] = [
        GunSound(assetName: "go_gun", displayName: "potato"),
        GunSound(assetName: "go_gun", displayName: "potato"),
        GunSound(assetName: "go_gun", displayName: "potato")
    ]
}
