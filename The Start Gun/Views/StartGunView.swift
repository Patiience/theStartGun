//
//  StartGunView.swift
//  The Start Gun
//
//  Created by Daniel Lu on 1/5/26.

import SwiftUI

struct StartGunView: View {
    // StateObjects define views @ObservedObject means passed in, while StateObject is owned by current View
    @StateObject private var viewModel = StartGunViewModel()
    
    @EnvironmentObject var settings: SettingsViewModel
    @StateObject private var viewModel: StartGunViewModel

    init(settings: SettingsViewModel) {
        _viewModel = StateObject(
            wrappedValue: StartGunViewModel(settings: settings)
        )
    }

    var body: some View {
        VStack(spacing: 40) {

            // Big "car start" style button
            Button(action: {
                viewModel.startSequence()
            }) {
                Text("START")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 220, height: 220)
                    .background(Color.black)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.blue, lineWidth: 6)
                    )
            }

            // Show the delay after GO
            if let delay = viewModel.lastDelay {
                Text(String(format: "%.2f s", delay))
                    .font(.title)
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

#Preview {
    StartGunView()
}

