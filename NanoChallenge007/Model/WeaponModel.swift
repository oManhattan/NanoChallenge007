//
//  WeaponModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

//{
//    "name": "Akuoumaru",
//    "type": "Claymore",
//    "rarity": 4,
//    "baseAttack": 42,
//    "subStat": "ATK",
//    "passiveName": "Watatsumi Wavewalker",
//    "passiveDesc": "For every point of the entire party's combined maximum Energy capacity, the Elemental Burst DMG of the character equipping this weapon is increased by 0.12/0.15/0.18/0.21/0.24%. A maximum of 40/50/60/70/80% increased Elemental Burst DMG can be achieved this way.",
//    "location": "Gacha",
//    "ascensionMaterial": "distantant-sea"
//}

struct WeaponModel: JSONModel {
    var name: String
    var type: String
    var rarity: Int
    var baseAttack: Int
    var subStat: String
    var passiveName: String
    var passiveDesc: String
    var location: String
    var ascensionMaterial: String
}
