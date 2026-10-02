//
//  swimTeamView.swift
//  CAASwim
//
//  Created by Trevor J. Nolan on 10/1/26.
//
import SwiftUI

struct SwimTeamView: View {
    let viewModel: SwimTeamViewModel
    let team: SwimTeam

    private var currentTeam: SwimTeam {
        viewModel.find(id: team.id) ?? team
    }

    var body: some View {
        Form {
            Section {
                HStack {
                    Spacer()

                    Image(currentTeam.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)

                    Spacer()
                }
            }

            Section("Team Information") {
                Text(currentTeam.name)
                    .font(.headline)

                Text(currentTeam.nickname)

                Text(currentTeam.location)
                    .foregroundStyle(.secondary)
            }

            Section("SwimCloud") {
                Toggle(
                    "New SwimCloud Times",
                    isOn: Binding(
                        get: {
                            currentTeam.hasNewTimes
                        },
                        set: { newValue in
                            var updatedTeam = currentTeam
                            updatedTeam.hasNewTimes = newValue
                            viewModel.update(team: updatedTeam)
                        }
                    )
                )

                if currentTeam.hasNewTimes {
                    Text("New times are available.")
                        .foregroundStyle(.green)
                } else {
                    Text("No new times available.")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .navigationTitle(currentTeam.name)
    }
}

#Preview {
    SwimTeamView(
        viewModel: SwimTeamViewModel(),
        team: SwimTeam(
            id: 1,
            name: "Monmouth University",
            nickname: "Hawks",
            location: "West Long Branch, NJ",
            imageName: "monmouth",
            hasNewTimes: false
        )
    )
}
