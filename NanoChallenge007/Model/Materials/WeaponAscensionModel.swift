//
//  WeaponAscensionModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

//"decarabian": {
//    "weapons": [
//        "apprentice's-notes",
//        "aquila-favonia",
//        "cool-steel",
//        "cinnabar-spindle",
//        "dull-blade",
//        "favonius-codex",
//        "favonius-sword",
//        "ferrous-shadow",
//        "magic-guide",
//        "mitternachts-waltz",
//        "pocket-grimoire",
//        "raven-bow",
//        "royal-grimoire",
//        "royal-longsword",
//        "silver-sword",
//        "snow-tombed-starsilver",
//        "song-of-broken-pines",
//        "the-alley-flash",
//        "the-bell",
//        "the-stringless",
//        "the-viridescent-hunt"
//    ],
//    "availability": [
//        "Monday",
//        "Thursday",
//        "Sunday"
//    ],
//    "source": "cecilia-garden",
//    "items": [
//        {
//            "id": "tile-of-decarabian's-tower",
//            "name": "Tile of Decarabian's Tower",
//            "rarity": 2
//        },
//        {
//            "id": "debris-of-decarabian's-city",
//            "name": "Debris of Decarabian's City",
//            "rarity": 3
//        },
//        {
//            "id": "fragment-of-decarabian's-epic",
//            "name": "Fragment of Decarabian's Epic",
//            "rarity": 4
//        },
//        {
//            "id": "scattered-piece-of-decarabian's-dream",
//            "name": "Scattered Piece of Decarabian's Dream",
//            "rarity": 5
//        }
//    ]
//}

struct WeaponAscensionModel: JSONModel {
    var weapons: [String]
    var availability: [String]
    var source: String
    var items: [MaterialItemModel]
}
