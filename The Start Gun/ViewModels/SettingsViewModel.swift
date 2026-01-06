//
//  SettingsViewModel.swift
//  The Start Gun
//
//  Created by Daniel Lu on 1/5/26.
//

import Foundation
import SwiftUI
import Combine

// Runs all state updates on the main thread (required for UI updates)
@MainActor
final class SettingsViewModel: ObservableObject {

    // MARK: - Sound Selections (UI-reactive)

    // Currently selected sounds for each race command
    @Published var onYourMarksSound: GunSound
    @Published var setSound: GunSound
    @Published var goSound: GunSound

    // MARK: - Timing Settings

    // Random delay range between SET and GO
    @Published var minSetToGoDelay: Double
    @Published var maxSetToGoDelay: Double

    // Delay before "On Your Marks" (typically 15 or 20 seconds)
    @Published var marksWaitTime: Int

    // MARK: - Initialization

    init() {
        // Load saved sounds if they exist, otherwise use app defaults
        self.onYourMarksSound =
            SettingsStorage.loadSound(for: .onYourMarks)
            ?? GunSoundDefaults.onYourMarks

        self.setSound =
            SettingsStorage.loadSound(for: .set)
            ?? GunSoundDefaults.set

        self.goSound =
            SettingsStorage.loadSound(for: .go)
            ?? GunSoundDefaults.go

        // Load saved timing values or fall back to defaults
        self.minSetToGoDelay =
            SettingsStorage.minDelay ?? 1.5

        self.maxSetToGoDelay =
            SettingsStorage.maxDelay ?? 2.5

        self.marksWaitTime =
            SettingsStorage.marksWaitTime ?? 15
    }

    // MARK: - Persistence

    // Saves current settings to UserDefaults
    // Call this whenever the user changes a setting
    func save() {
        SettingsStorage.saveSound(onYourMarksSound)
        SettingsStorage.saveSound(setSound)
        SettingsStorage.saveSound(goSound)

        SettingsStorage.set(minSetToGoDelay, forKey: "minDelay")
        SettingsStorage.set(maxSetToGoDelay, forKey: "maxDelay")
        SettingsStorage.set(marksWaitTime, forKey: "marksWaitTime")
    }
}
