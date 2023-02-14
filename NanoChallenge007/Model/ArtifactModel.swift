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
    var onePieceBonus: String?
    var twoPieceBonus: String?
    var fourPieceBonus: String?
    var rarity: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case onePieceBonus = "1-piece_bonus"
        case twoPieceBonus = "2-piece_bonus"
        case fourPieceBonus = "4-piece_bonus"
        case rarity = "max_rarity"
    }
}
