//
//  CommonAscensionModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

//"slime": {
//    "characters": [
//        "lisa",
//        "venti",
//        "xiangling",
//        "zhongli"
//    ],
//    "items": [
//        {
//            "id": "slime-condensate",
//            "name": "Slime Condensate",
//            "rarity": 1
//        },
//        {
//            "id": "slime-secretions",
//            "name": "Slime Secretions",
//            "rarity": 2
//        },
//        {
//            "id": "slime-concentrate",
//            "name": "Slime Concentrate",
//            "rarity": 3
//        }
//    ],
//    "sources": [
//        "Slime"
//    ]
//}

//"chaos-parts": {
//    "weapons": [
//        "amos'-bow",
//        "beginner's-protector",
//        "favonius-greatsword",
//        "favonius-lance",
//        "favonius-warbow",
//        "frostbearer",
//        "iron-point",
//        "lost-prayer-to-the-sacred-winds",
//        "otherworldly-story",
//        "recurve-bow",
//        "royal-bow",
//        "royal-greatsword",
//        "sacrificial-fragments",
//        "sacrificial-sword",
//        "skyward-spine",
//        "traveler's-handy-sword",
//        "white-iron-greatsword",
//        "wolf's-gravestone"
//    ],
//    "items": [
//        {
//            "id": "chaos-device",
//            "name": "Chaos Device",
//            "rarity": 2
//        },
//        {
//            "id": "chaos-circuit",
//            "name": "Chaos Circuit",
//            "rarity": 3
//        },
//        {
//            "id": "chaos-core",
//            "name": "Chaos Core",
//            "rarity": 4
//        }
//    ],
//    "sources": [
//        "Ruin Guard",
//        "Ruin Hunter",
//        "Ruin Grader"
//    ]
//}

struct CommonAscensionModel: JSONModel {
    var characters: [String]?
    var weapons: [String]?
    var items: [MaterialItemModel]
    var sources: [String]
}
