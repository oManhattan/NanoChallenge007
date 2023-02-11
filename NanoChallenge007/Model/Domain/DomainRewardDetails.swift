//
//  DomainRewardDetails.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

struct DomainRewardDetails: JSONModel {
    var level: Int
    var adventureExperience: Int
    var companionshipExperience: Int
    var mora: Int
    var drops: [DomainDrop]?
    var items: [DomainDrop]?
}
