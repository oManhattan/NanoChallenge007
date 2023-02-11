//
//  BossMaterialModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

//"hurricane-seed": {
//    "name": "Hurricane Seed",
//    "source": "Anemo Hypostasis",
//    "characters": [
//        "jean",
//        "sucrose",
//        "venti"
//    ]
//}

import Foundation

struct BossMaterialModel: JSONModel {
    var name: String
    var source: String
    var characters: [String]
}
