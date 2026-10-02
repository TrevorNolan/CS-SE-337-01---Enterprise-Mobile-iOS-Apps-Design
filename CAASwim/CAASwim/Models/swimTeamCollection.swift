//
//  swimTeamCollection.swift
//  CAASwim
//
//  Created by Trevor J. Nolan on 10/1/26.
//
import Foundation

struct SwimTeamCollection {
    var teams: [SwimTeam]

    init() {
        teams = [
            SwimTeam(
                id: 1,
                name: "Monmouth University",
                nickname: "Hawks",
                location: "West Long Branch, NJ",
                imageName: "monmouth",
                hasNewTimes: false
            ),
            SwimTeam(
                id: 2,
                name: "Drexel University",
                nickname: "Dragons",
                location: "Philadelphia, PA",
                imageName: "drexel",
                hasNewTimes: false
            ),
            SwimTeam(
                id: 3,
                name: "UNC Wilmington",
                nickname: "Seahawks",
                location: "Wilmington, NC",
                imageName: "uncw",
                hasNewTimes: false
            ),
            SwimTeam(
                id: 4,
                name: "William & Mary",
                nickname: "Tribe",
                location: "Williamsburg, VA",
                imageName: "williamandmary",
                hasNewTimes: false
            ),
            SwimTeam(
                id: 5,
                name: "Towson University",
                nickname: "Tigers",
                location: "Towson, MD",
                imageName: "towson",
                hasNewTimes: false
            ),
            SwimTeam(
                id: 6,
                name: "Campbell University",
                nickname: "Fighting Camels",
                location: "Buies Creek, NC",
                imageName: "campbell",
                hasNewTimes: false
            ),
            SwimTeam(
                id: 7,
                name: "Northeastern University",
                nickname: "Huskies",
                location: "Boston, MA",
                imageName: "northeastern",
                hasNewTimes: false
            )
        ]
    }

    func find(id: Int) -> SwimTeam? {
        return teams.first { $0.id == id }
    }

    mutating func update(team: SwimTeam) {
        if let index = teams.firstIndex(where: { $0.id == team.id }) {
            teams[index] = team
        }
    }
}
