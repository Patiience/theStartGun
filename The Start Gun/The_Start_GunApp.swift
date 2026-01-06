//
//  The_Start_GunApp.swift
//  The Start Gun
//
//  Created by Daniel Lu on 1/2/26.
//

import SwiftUI        // SwiftUI framework for building the UI


@main
struct The_Start_GunApp: App {   // Main entry point of the 
    
    @StateObject private var settingsVM = SettingsViewModel()

    // Defines the app’s UI scenes (windows)
    var body: some Scene {
        WindowGroup {             // Main app window
            StartGunView()         // Root view shown at launch
                .environmentObject(settingsVM)
        }
    }
}

