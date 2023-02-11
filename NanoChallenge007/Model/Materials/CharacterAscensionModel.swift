//
//  CharacterAscensionModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

//"anemo": {
//    "sliver": {
//        "id": "vayuda-turquoise-sliver",
//        "name": "Vayuda Turquoise Sliver",
//        "sources": [
//            "Anemo Hypostasis",
//            "Wolf of the North",
//            "Souvenir shop",
//            "Memories: Storming Terror I",
//            "Memories: Storming Terror II",
//            "Memories: Storming Terror III",
//            "Memories: Storming Terror IV",
//            "Memories: Storming Terror V",
//            "Memories: Storming Terror VI",
//            "Memories: The Golden Shadow I",
//            "Memories: The Golden Shadow II",
//            "Memories: The Golden Shadow III",
//            "Memories: The Golden Shadow IV"
//        ],
//        "rarity": 2
//    },
//    "fragment": {
//        "id": "vayuda-turquoise-fragment",
//        "name": "Vayuda Turquoise Fragment",
//        "sources": [
//            "Anemo Hypostasis",
//            "Wolf of the North",
//            "Memories: Storming Terror I",
//            "Memories: Storming Terror II",
//            "Memories: Storming Terror III",
//            "Memories: Storming Terror IV",
//            "Memories: Storming Terror V",
//            "Memories: Storming Terror VI",
//            "Memories: The Golden Shadow I",
//            "Memories: The Golden Shadow II",
//            "Memories: The Golden Shadow III",
//            "Memories: The Golden Shadow IV"
//        ],
//        "rarity": 3
//    },
//    "chunk": {
//        "id": "vayuda-turquoise-chunk",
//        "name": "Vayuda Turquoise Chunk",
//        "sources": [
//            "Anemo Hypostasis",
//            "Wolf of the North",
//            "Memories: Storming Terror III",
//            "Memories: Storming Terror IV",
//            "Memories: Storming Terror V",
//            "Memories: Storming Terror VI",
//            "Memories: The Golden Shadow I",
//            "Memories: The Golden Shadow II",
//            "Memories: The Golden Shadow III",
//            "Memories: The Golden Shadow IV"
//        ],
//        "rarity": 4
//    },
//    "gemstone": {
//        "id": "vayuda-turquoise-gemstone",
//        "name": "Vayuda Turquoise Gemstone",
//        "sources": [
//            "Anemo Hypostasis",
//            "Wolf of the North",
//            "Memories: Storming Terror V",
//            "Memories: Storming Terror VI",
//            "Memories: The Golden Shadow III",
//            "Memories: The Golden Shadow IV"
//        ],
//        "rarity": 5
//    }
//}

struct CharacterAscensionModel: JSONModel {
    var id: String
    var name: String
    var sources: [String]
    var rarity: Int
}
