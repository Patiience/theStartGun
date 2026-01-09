//
//  StartGunViewModel.swift
//  The Start Gun
//
//  Created by Daniel Lu on 1/5/26.
//

import Foundation
import Combine

// Runs on main thread so it can safely update UI state
@MainActor
final class StartGunViewModel: ObservableObject {

    // MARK: - Dependencies

    // Shared app settings (single source of truth)
    private let settings: SettingsViewModel = SettingsViewModel.shared

    // Audio playback service
    private let audioPlayer = AudioPlayerService.shared

    // MARK: - UI State

    // Indicates whether a start sequence is currently running
    // @Published - when this value changes, update the UI
    @Published var isRunning = false

    // Text shown to the user (optional, useful for debugging / UI)
    @Published var statusText: String = "Ready"
    
    @Published var lastDelay: Double? = nil

    // Task reference so the sequence can be cancelled
    private var sequenceTask: Task<Void, Never>?

    // MARK: - Public API

    /// Starts the full starter-gun sequence
    func startSequence() {
        // Prevent double-starts
        guard !isRunning else { return }

        isRunning = true
        statusText = "On Your Marks"

        // Cancel any previous task just in case
        sequenceTask?.cancel()

        sequenceTask = Task {
            await runSequence()
        }
    }

    /// Cancels the sequence immediately
    func cancelSequence() {
        sequenceTask?.cancel()
        audioPlayer.stop()
        isRunning = false
        statusText = "Cancelled"
    }

    // MARK: - Sequence Logic

    private func runSequence() async {
        do {
            // 1️⃣ On Your Marks
            audioPlayer.playSound(named: GunSoundDefaults.onYourMarksSound.assetName)

            try await sleep(seconds: Double(settings.marksWaitTime))

            // 2️⃣ Set
            statusText = "Set"
            audioPlayer.playSound(named: GunSoundDefaults.setSound.assetName)

            // Random delay between Set and Go
            let randomDelay = Double.random(
                in: settings.minSetToGoDelay...settings.maxSetToGoDelay
            )
            
            lastDelay = randomDelay

            try await sleep(seconds: randomDelay)

            // 3️⃣ Go!
            statusText = "Go!"
            audioPlayer.playSound(named: settings.goSound.assetName)

            // Sequence complete
            isRunning = false
        } catch {
            // Task was cancelled
            isRunning = false
            statusText = "Ready"
        }
    }

    // MARK: - Helpers

    /// Async sleep that supports task cancellation
    private func sleep(seconds: Double) async throws {
        try await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
    }
}
