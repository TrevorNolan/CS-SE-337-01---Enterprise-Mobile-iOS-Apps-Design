//
//  swimTeamViewModel.swift
//  CAASwim
//
//  Created by Trevor J. Nolan on 10/1/26.
//

import Foundation
import Observation

@Observable
class SwimTeamViewModel {
    var teamCollection = SwimTeamCollection()

    func find(id: Int) -> SwimTeam? {
        return teamCollection.find(id: id)
    }

    func update(team: SwimTeam) {
        teamCollection.update(team: team)
    }

    func toggleNewTimes(for team: SwimTeam) {
        var updatedTeam = team
        updatedTeam.hasNewTimes.toggle()
        update(team: updatedTeam)
    }
}
