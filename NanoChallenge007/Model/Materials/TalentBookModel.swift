//
//  TalentBookModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

//"freedom": {
//    "characters": [
//        "aloy",
//        "amber",
//        "barbara",
//        "diona",
//        "klee",
//        "sucrose",
//        "tartaglia",
//        "traveler-anemo",
//        "traveler-geo"
//    ],
//    "availability": [
//        "Monday",
//        "Thursday",
//        "Sunday"
//    ],
//    "source": "forsaken-rift",
//    "items": [
//        {
//            "id": "teachings-of-freedom",
//            "name": "Teachings of Freedom",
//            "rarity": 2
//        },
//        {
//            "id": "guide-to-freedom",
//            "name": "Guide to Freedom",
//            "rarity": 3
//        },
//        {
//            "id": "philosophies-of-freedom",
//            "name": "Philosophies of Freedom",
//            "rarity": 4
//        }
//    ]
//}

struct TalentBookModel: JSONModel {
    var characters: [String]
    var availability: [String]
    var source: String
    var items: [MaterialItemModel]
}
