//
//  GunSoundDefaults.swift
//  The Start Gun
//
//  Created by Daniel Lu on 1/6/26.
//

struct SoundDefaults {
    static let onYourMarksSound = Sound(
        assetName: "on_your_marks",
        displayName: "On Your Marks!"
    )

    static let setSound = Sound(
        assetName: "set",
        displayName: "set"
    )
    
    // User-selectable gun sounds
    static let gunSounds: [Sound] = [
        Sound(assetName: "defaultGun", displayName: "Default"),
        Sound(assetName: "heavyGun", displayName: "Heavy"),
        Sound(assetName: "lightGun", displayName: "Light")
    ]
}
