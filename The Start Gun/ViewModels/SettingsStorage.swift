//
//  SettingsStorage.swift
//  The Start Gun
//
//  Created by Daniel Lu on 1/6/26.
//

import Foundation

// Centralized UserDefaults access
// Keeps persistence logic OUT of ViewModels
enum SettingsStorage {

    // Standard persistent storage for simple app settings
    private static let defaults = UserDefaults.standard

    // MARK: - Sound Storage

    // Generates a unique key per sound type
    static func key(for type: GunSoundType) -> String {
        "sound_\(type.rawValue)"
    }

    // Saves only the asset name (not the full model)
    static func saveSound(_ sound: GunSound) {
        defaults.set(sound.assetName, forKey: key(for: sound.type))
    }

    // Loads a sound selection if it exists
    static func loadSound(for type: GunSoundType) -> GunSound? {
        guard let assetName = defaults.string(forKey: key(for: type)) else {
            return nil
        }
        return GunSound(type: type, assetName: assetName)
    }

    // MARK: - Timing Storage

    // Optional values allow clean fallback to defaults
    static var minDelay: Double? {
        defaults.object(forKey: "minDelay") as? Double
    }

    static var maxDelay: Double? {
        defaults.object(forKey: "maxDelay") as? Double
    }

    static var marksWaitTime: Int? {
        defaults.object(forKey: "marksWaitTime") as? Int
    }

    // Generic setters keep the API small and flexible
    static func set(_ value: Double, forKey key: String) {
        defaults.set(value, forKey: key)
    }

    static func set(_ value: Int, forKey key: String) {
        defaults.set(value, forKey: key)
    }
}

