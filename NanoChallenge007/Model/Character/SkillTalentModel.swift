//
//  SkillTalentModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 01/02/23.
//

import Foundation

struct SkillTalentModel: JSONModel {
    
    var name: String
    var unlock: String
    var description: String
    var upgrades: [SkillUpgradeModel]?
    var type: String?
    
    enum CodingKeys: String, CodingKey {
        case name, unlock, description, upgrades, type
    }
    
}
