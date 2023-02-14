//
//  EnemyModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

//{
//    "id": "abyss-mage",
//    "name": "Abyss Mage",
//    "description": "Abyss creatures who can command the power of the elements in combat to a certain extent. For unknown reasons, abyss mages are able to communicate with the hilichurls, thus enabling them to manipulate their minds easily. They say abyss mages utter a long-forgotten language from which they draw magical power.",
//    "region": "Global",
//    "type": "Elite Enemies",
//    "family": "The Abyss",
//    "faction": "Abyss Order",
//    "elements": [
//        "Hydro",
//        "Pyro",
//        "Cryo"
//    ],
//    "drops": [
//        {
//            "name": "Dead Ley Line Branch",
//            "rarity": 2,
//            "minimum-level": 1
//        },
//        {
//            "name": "Dead Ley Line Leaves",
//            "rarity": 3,
//            "minimum-level": 40
//        },
//        {
//            "name": "Ley Line Sprouts",
//            "rarity": 4,
//            "minimum-level": 60
//        }
//    ],
//    "artifacts": [
//        {
//            "name": "Blood-Soaked",
//            "set": "Berserker",
//            "rarity": "3/4"
//        },
//        {
//            "name": "Instructor's Brooch",
//            "set": "Instructor",
//            "rarity": "3/4"
//        },
//        {
//            "name": "Legacy",
//            "set": "The Exile",
//            "rarity": "3/4"
//        },
//        {
//            "name": "Curative",
//            "set": "Traveling Doctor",
//            "rarity": "3"
//        }
//    ],
//    "elemental-description": [
//        {
//            "element": "Hydro",
//            "description": "Abyss creatures that utilize Hydro energy in battle. Stories circulate among adventurers that Abyss Mages are at the lowest rung of the Abyss Order's hierarchy and that they roam the various lands to scheme fell deeds of destruction. Though they also often make fun of these Abyss Mages, saying that the most harm they can do is to cause rheumatism or a common cold, their power is not to be underestimated."
//        },
//        {
//            "element": "Pyro",
//            "description": "Abyss creatures who command the power of Pyro in battle. For unknown reasons, Abyss Mages are able to communicate with the hilichurls, thus enabling them to manipulate their minds easily. They say that Abyss Mages utter a long-forgotten language from which they draw magical power."
//        },
//        {
//            "element": "Cryo",
//            "description": "Abyss creatures that call upon Cryo in battle. Though they dabble with great power and can even create icicles by condensing and freezing water vapor in the atmosphere, their bodies are very vulnerable in and of themselves. Once their protective barrier has been broken, they are at your mercy."
//        }
//    ],
//    "mora-gained": 200
//}

struct EnemyModel: JSONModel {
    var id: String
    var name: String
    var description: String?
    var region: String
    var type: String
    var family: String
    var faction: String?
    var elements: [String]?
    var drops: [EnemyDropModel]?
    var artifacts: [EnemyArtifactDropModel]?
    var elementalDescription: [EnemyElementModel]?
    var moraGained: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, region, type, family, faction, elements, drops, artifacts
        case elementalDescription = "elemental-description"
        case moraGained = "mora-gained"
    }
}
