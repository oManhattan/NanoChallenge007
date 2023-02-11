//
//  LocalSpecialtiesModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

//{
//    "id": "calla-lily",
//    "name": "Calla Lily",
//    "characters": [
//        "diona",
//        "kaeya"
//    ]
//}

struct LocalSpecialtiesModel: JSONModel {
    var id: String
    var name: String
    var characters: [String]
}
