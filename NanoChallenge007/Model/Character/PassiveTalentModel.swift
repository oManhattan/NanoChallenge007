//
//  PassiveTalentModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 01/02/23.
//

import Foundation

struct PassiveTalentModel: JSONModel {
    
    var name: String
    var unlock: String
    var description: String
    var level: Int?
    
    enum CodingKeys: String, CodingKey {
        case name, unlock, description, level
    }
    
}
