//
//  DomainReward.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

struct DomainReward: JSONModel {
    var day: String
    var details: [DomainRewardDetails]
}
