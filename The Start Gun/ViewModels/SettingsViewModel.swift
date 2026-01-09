//
//  SettingsViewModel.swift
//  The Start Gun
//
//  Created by Daniel Lu on 1/5/26.
//

import Foundation
import Combine

@MainActor
final class SettingsViewModel: ObservableObject {
    static let shared = SettingsViewModel()

    @Published var goSound: GunSound = GunSoundDefaults.gunSounds.first!

    @Published var minSetToGoDelay: Double
    @Published var maxSetToGoDelay: Double
    @Published var marksWaitTime: Int

    init() {
        self.goSound =
            SettingsStorage.loadGoSound()
            ?? GunSoundDefaults.gunSounds.first!

        self.minSetToGoDelay =
            SettingsStorage.minDelay ?? 1.5

        self.maxSetToGoDelay =
            SettingsStorage.maxDelay ?? 2.5

        self.marksWaitTime =
            SettingsStorage.marksWaitTime ?? 15
    }

    func save() {
        SettingsStorage.saveGoSound(goSound)
        SettingsStorage.setMinDelay(minSetToGoDelay)
        SettingsStorage.setMaxDelay(maxSetToGoDelay)
        SettingsStorage.setMarksWaitTime(marksWaitTime)
    }
}

