//
//  GunSoundDefaults.swift
//  The Start Gun
//
//  Created by Daniel Lu on 1/6/26.
//

struct GunSoundDefaults {
    static let onYourMarksSound = GunSound(
        assetName: "on_your_marks",
        displayName: "On Your Marks!"
    )

    static let setSound = GunSound(
        assetName: "set",
        displayName: "set"
    )
    
    // User-selectable gun sounds
    static let gunSounds: [GunSound] = [
        GunSound(assetName: "go_gun", displayName: "potato"),
        GunSound(assetName: "go_gun", displayName: "potato"),
        GunSound(assetName: "go_gun", displayName: "potato")
    ]
}
