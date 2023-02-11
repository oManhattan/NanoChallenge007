//
//  EnemyDropModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

struct EnemyDropModel: JSONModel {
    var name: String
    var rarity: Int
    var minimumLevel: Int
    
    enum CodingKeys: String, CodingKey {
        case name, rarity
        case minimumLevel = "minimum-level"
    }
}
