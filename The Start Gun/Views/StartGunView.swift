//
//  StartGunView.swift
//  The Start Gun
//
//  Created by Daniel Lu on 1/5/26.

import SwiftUI

struct StartGunView: View {

    @StateObject private var viewModel: StartGunViewModel = StartGunViewModel()

    var body: some View {
        ZStack {

            // MARK: - Background
            Image("futuristic_background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .overlay(
                    LinearGradient(
                        colors: [.black.opacity(0.7), .black.opacity(0.9)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

            VStack(spacing: 48) {

                Spacer()

                // MARK: - START Button
                Button {
                    viewModel.startSequence()
                } label: {
                    ZStack {
                        Circle()
                            .fill(
                                RadialGradient(
                                    colors: [.blue.opacity(0.9), .black],
                                    center: .center,
                                    startRadius: 10,
                                    endRadius: 120
                                )
                            )

                        Circle()
                            .stroke(Color.blue, lineWidth: 6)

                        Text("START")
                            .font(.system(size: 42, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                    }
                    .frame(width: 220, height: 220)
                }
                .buttonStyle(.plain)

                // MARK: - Delay Readout
                if let delay = viewModel.lastDelay {
                    Text(String(format: "%.2f s", delay))
                        .font(.title.monospacedDigit())
                        .foregroundStyle(.blue)
                        .transition(.opacity.combined(with: .scale))
                        .animation(.easeInOut(duration: 0.25), value: viewModel.lastDelay)
                }

                Spacer()
            }
            .padding()
        }
    }
}


