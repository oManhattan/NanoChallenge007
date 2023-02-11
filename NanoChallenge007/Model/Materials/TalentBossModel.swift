//
//  TalentBossModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

//"tail-of-boreas": {
//    "id": "tail-of-boreas",
//    "name": "Tail of Boreas",
//    "characters": [
//        "qiqi",
//        "venti",
//        "xingqiu",
//        "traveler-geo"
//    ]
//}

struct TalentBossModel: JSONModel {
    var id: String
    var name: String
    var characters: [String]
}
