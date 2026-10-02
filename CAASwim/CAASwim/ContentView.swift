//
//  ContentView.swift
//  CAASwim
//
//  Created by Trevor J. Nolan on 10/1/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = SwimTeamViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.teamCollection.teams, id: \.id) { team in
                NavigationLink {
                    SwimTeamView(
                        viewModel: viewModel,
                        team: team
                    )
                } label: {
                    HStack(spacing: 15) {
                        Image(team.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)

                        VStack(alignment: .leading, spacing: 4) {
                            Text(team.name)
                                .font(.headline)

                            Text(team.nickname)
                                .font(.subheadline)

                            Text(team.location)
                                .font(.caption)
                                .foregroundStyle(.secondary)

                            if team.hasNewTimes {
                                Text("New SwimCloud Times")
                                    .font(.caption)
                                    .foregroundStyle(.green)
                            } else {
                                Text("No New Times")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("CAA Swimming")
        }
    }
}

#Preview {
    ContentView()
}
