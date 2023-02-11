//
//  CookingIngredientModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

//"bacon": {
//    "name": "Bacon",
//    "description": "Smoked strips of pork. With just enough fat, but not too greasy.Mmmmm... Bacon.Meat must be processed first to be made into Bacon.",
//    "rarity": 3,
//    "sources": [
//        "Sold by Good Hunter",
//        "Processing"
//    ]
//}

struct CookingIngredientModel: JSONModel {
    var name: String
    var description: String
    var rarity: Int?
    var sources: [String]
}
