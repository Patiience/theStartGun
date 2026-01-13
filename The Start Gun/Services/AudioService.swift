//
//  AudioService.swift
//  The Start Gun
//
//  Created by Daniel Lu on 1/5/26.
//

import Foundation
import AVFoundation

// Simple service responsible ONLY for audio playback
final class AudioPlayerService {

    // Shared instance (stateless, safe to reuse)
    static let shared = AudioPlayerService()

    private var player: AVAudioPlayer?

    private init() {}

    // MARK: - Playback

    /// Plays a sound from Assets.xcassets by name
    func playSound(named assetName: String) {
        // Stop any currently playing sound
        player?.stop()

        // Locate the audio file in the app bundle
        guard let url = Bundle.main.url(forResource: assetName, withExtension: "wav") else {
            print("Audio file not found: \(assetName)")
            return
        }

        do {
            // Create and play audio
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("Failed to play sound: \(error)")
        }
    }

    /// Stops any currently playing audio
    func stop() {
        player?.stop()
    }
}
