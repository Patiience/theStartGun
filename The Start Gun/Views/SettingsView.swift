//
//  SettingsView.swift
//  The Start Gun
//
//  Created by Daniel Lu on 1/5/26.
//

import SwiftUI

struct SettingsView: View {

    // View does NOT own the settings
    // It just observes a shared SettingsViewModel
    @ObservedObject var settingsViewModel: SettingsViewModel

    var body: some View {
        Form {
            // MARK: - Sound Selection
            Section(header: Text("Gun Sound")) {

                // Picker binds directly to the selected sound
                Picker("Sound", selection: $settingsViewModel.goSound) {
                    ForEach(GunSoundDefaults.gunSounds) { sound in
                        Text(sound.displayName)
                            .tag(sound)
                    }
                }
            }

            // MARK: - MinMax Delay Sliders
            Section(header: Text("Set → Go Delay")) {

                VStack(alignment: .leading, spacing: 12) {

                    // MIN delay slider
                    Text("Minimum: \(settingsViewModel.minSetToGoDelay, specifier: "%.1f") s")
                        .font(.caption.monospacedDigit())

                    Slider(
                        value: $settingsViewModel.minSetToGoDelay,
                        in: 1.5...2.0,
                        step: 0.1
                    )

                    // MAX delay slider
                    Text("Maximum: \(settingsViewModel.maxSetToGoDelay, specifier: "%.1f") s")
                        .font(.caption.monospacedDigit())

                    Slider(
                        value: $settingsViewModel.maxSetToGoDelay,
                        in: 2.0...3.0,
                        step: 0.1
                    )
                }
            }.onChange(of: settingsViewModel.minSetToGoDelay) { _,newDelay in
                settingsViewModel.save()
            }
            .onChange(of: settingsViewModel.maxSetToGoDelay) { _,newDelay in
                settingsViewModel.save()
            }
        }
        .navigationTitle("Settings")
    }
}
