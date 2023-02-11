//
//  SkillUpgrade.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 07/02/23.
//

import Foundation

struct SkillUpgradeModel: JSONModel {
    var name: String
    var value: String
    
    enum CodingKeys: String, CodingKey {
        case name, value
    }
}
