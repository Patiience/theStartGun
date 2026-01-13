//
//  SettingsStorage.swift
//  The Start Gun
//
//  Created by Daniel Lu on 1/6/26.
//

import Foundation

enum SettingsStorage {

    private static let defaults = UserDefaults.standard

    // MARK: - Keys

    private static let goSoundKey = "goSound"
    private static let minDelayKey = "minDelay"
    private static let maxDelayKey = "maxDelay"
    private static let marksWaitTimeKey = "marksWaitTime"

    // MARK: - Gun Sound

    /// Save selected gun sound (asset name only)
    static func saveGoSound(_ sound: Sound) {
        defaults.set(sound.assetName, forKey: goSoundKey)
    }

    /// Load selected gun sound if it exists
    static func loadGoSound() -> Sound? {
        guard let assetName = defaults.string(forKey: goSoundKey) else {
            return nil
        }

        // Map back to known defaults (safe)
        return SoundDefaults.gunSounds.first {
            $0.assetName == assetName
        }
    }

    // MARK: - Timing

    static var minDelay: Double? {
        defaults.object(forKey: minDelayKey) as? Double
    }

    static var maxDelay: Double? {
        defaults.object(forKey: maxDelayKey) as? Double
    }

    static var marksWaitTime: Int? {
        defaults.object(forKey: marksWaitTimeKey) as? Int
    }

    static func setMinDelay(_ value: Double) {
        defaults.set(value, forKey: minDelayKey)
    }

    static func setMaxDelay(_ value: Double) {
        defaults.set(value, forKey: maxDelayKey)
    }

    static func setMarksWaitTime(_ value: Int) {
        defaults.set(value, forKey: marksWaitTimeKey)
    }
}
