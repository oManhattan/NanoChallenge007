//
//  ArtifactsModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

//{
//    "name": "Adventurer",
//    "max_rarity": 3,
//    "2-piece_bonus": "Max HP increased by 1,000.",
//    "4-piece_bonus": "Opening chest regenerates 30% Max HP over 5s."
//}

struct ArtifactModel: JSONModel {
    var name: String
    var rarity: Int
    var boundsLevel1: String
    var boundsLevel2: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case rarity = "max_rarity"
        case boundsLevel1 = "2_piece_bounds"
        case boundsLevel2 = "4_pieceBounds"
    }
}
