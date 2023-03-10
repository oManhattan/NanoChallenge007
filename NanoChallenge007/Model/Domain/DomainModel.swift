//
//  DomainModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

struct DomainModel: JSONModel {
    var name: String
    var type: String
    var description: String
    var location: String
    var nation: String
    var requirements: [DomainRequirementsModel]
    var recommendedElements: [String]
    var rewards: [DomainReward]
}

//{
//    "name": "Cecilia Garden",
//    "type": "Forgery",
//    "description": "The Cecilia flowers that only grow on high cliffs once bloomed in the greenhouses here.\nThe ancient civilization that once enjoyed the scent of the Cecilia was lost, and so too was the sea of white flowers.",
//    "location": "Wolvendom, Windwail Highland, Mondstadt",
//    "nation": "Mondstadt",
//    "requirements": [
//        {
//            "level": 1,
//            "adventureRank": 16,
//            "recommendedLevel": 15,
//            "leyLineDisorder": [
//                "Your character will be periodically inflicted with Slowing Water, greatly increasing your skill's CD duration (-80% Reduce CD) until the inflicted Hydro element is removed."
//            ]
//        },
//        {
//            "level": 2,
//            "adventureRank": 21,
//            "recommendedLevel": 36,
//            "leyLineDisorder": [
//                "Your character will be periodically inflicted with Slowing Water, greatly increasing your skill's CD duration (-100% Reduce CD) until the inflicted Hydro element is removed."
//            ]
//        },
//        {
//            "level": 3,
//            "adventureRank": 30,
//            "recommendedLevel": 59,
//            "leyLineDisorder": [
//                "Your character will be periodically inflicted with Slowing Water, greatly increasing your skill's CD duration (-100% Reduce CD) until the inflicted Hydro element is removed."
//            ]
//        },
//        {
//            "level": 4,
//            "adventureRank": 40,
//            "recommendedLevel": 80,
//            "leyLineDisorder": [
//                "Your character will be periodically inflicted with Slowing Water, greatly increasing your skill's CD duration (-100% Reduce CD) until the inflicted Hydro element is removed."
//            ]
//        }
//    ],
//    "recommendedElements": [
//        "Electro",
//        "Cryo",
//        "Pyro"
//    ],
//    "rewards": [
//        {
//            "day": "mon",
//            "details": [
//                {
//                    "level": 1,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 10,
//                    "mora": 1125,
//                    "drops": [
//                        {
//                            "name": "Tile of Decarabian's Tower",
//                            "drop_min": 4,
//                            "drop_max": 6
//                        }
//                    ]
//                },
//                {
//                    "level": 2,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 15,
//                    "mora": 1550,
//                    "drops": [
//                        {
//                            "name": "Tile of Decarabian's Tower",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Debris of Decarabian's City",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        }
//                    ]
//                },
//                {
//                    "level": 3,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 15,
//                    "mora": 1850,
//                    "drops": [
//                        {
//                            "name": "Tile of Decarabian's Tower",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Debris of Decarabian's City",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Fragment of Decarabian's Epic",
//                            "drop_min": 0,
//                            "drop_max": 2
//                        }
//                    ]
//                },
//                {
//                    "level": 4,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 20,
//                    "mora": 2200,
//                    "items": [
//                        {
//                            "name": "Tile of Decarabian's Tower",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Debris of Decarabian's City",
//                            "drop_min": 0,
//                            "drop_max": 4
//                        },
//                        {
//                            "name": "Fragment of Decarabian's Epic",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Scattered Piece of Decarabian's Dream",
//                            "drop_min": 0,
//                            "drop_max": 1
//                        }
//                    ]
//                }
//            ]
//        },
//        {
//            "day": "tue",
//            "details": [
//                {
//                    "level": 1,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 10,
//                    "mora": 1125,
//                    "drops": [
//                        {
//                            "name": "Boreal Wolf's Milk Tooth",
//                            "drop_min": 4,
//                            "drop_max": 6
//                        }
//                    ]
//                },
//                {
//                    "level": 2,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 15,
//                    "mora": 1550,
//                    "drops": [
//                        {
//                            "name": "Boreal Wolf's Milk Tooth",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Boreal Wolf's Cracked Tooth",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        }
//                    ]
//                },
//                {
//                    "level": 3,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 15,
//                    "mora": 1850,
//                    "drops": [
//                        {
//                            "name": "Boreal Wolf's Milk Tooth",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Boreal Wolf's Cracked Tooth",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Boreal Wolf's Broken Fang",
//                            "drop_min": 0,
//                            "drop_max": 2
//                        }
//                    ]
//                },
//                {
//                    "level": 4,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 20,
//                    "mora": 2200,
//                    "items": [
//                        {
//                            "name": "Boreal Wolf's Milk Tooth",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Boreal Wolf's Cracked Tooth",
//                            "drop_min": 0,
//                            "drop_max": 4
//                        },
//                        {
//                            "name": "Boreal Wolf's Broken Fang",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Boreal Wolf's Nostalgia",
//                            "drop_min": 0,
//                            "drop_max": 1
//                        }
//                    ]
//                }
//            ]
//        },
//        {
//            "day": "wed",
//            "details": [
//                {
//                    "level": 1,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 10,
//                    "mora": 1125,
//                    "drops": [
//                        {
//                            "name": "Fetters of the Dandelion Gladiator",
//                            "drop_min": 4,
//                            "drop_max": 6
//                        }
//                    ]
//                },
//                {
//                    "level": 2,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 15,
//                    "mora": 1550,
//                    "drops": [
//                        {
//                            "name": "Fetters of the Dandelion Gladiator",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Chains of the Dandelion Gladiator",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        }
//                    ]
//                },
//                {
//                    "level": 3,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 15,
//                    "mora": 1850,
//                    "drops": [
//                        {
//                            "name": "Fetters of the Dandelion Gladiator",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Chains of the Dandelion Gladiator",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Shackles of the Dandelion Gladiator",
//                            "drop_min": 0,
//                            "drop_max": 2
//                        }
//                    ]
//                },
//                {
//                    "level": 4,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 20,
//                    "mora": 2200,
//                    "items": [
//                        {
//                            "name": "Fetters of the Dandelion Gladiator",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Chains of the Dandelion Gladiator",
//                            "drop_min": 0,
//                            "drop_max": 4
//                        },
//                        {
//                            "name": "Shackles of the Dandelion Gladiator",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Dream of the Dandelion Gladiator",
//                            "drop_min": 0,
//                            "drop_max": 1
//                        }
//                    ]
//                }
//            ]
//        },
//        {
//            "day": "thu",
//            "details": [
//                {
//                    "level": 1,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 10,
//                    "mora": 1125,
//                    "drops": [
//                        {
//                            "name": "Tile of Decarabian's Tower",
//                            "drop_min": 4,
//                            "drop_max": 6
//                        }
//                    ]
//                },
//                {
//                    "level": 2,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 15,
//                    "mora": 1550,
//                    "drops": [
//                        {
//                            "name": "Tile of Decarabian's Tower",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Debris of Decarabian's City",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        }
//                    ]
//                },
//                {
//                    "level": 3,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 15,
//                    "mora": 1850,
//                    "drops": [
//                        {
//                            "name": "Tile of Decarabian's Tower",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Debris of Decarabian's City",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Fragment of Decarabian's Epic",
//                            "drop_min": 0,
//                            "drop_max": 2
//                        }
//                    ]
//                },
//                {
//                    "level": 4,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 20,
//                    "mora": 2200,
//                    "items": [
//                        {
//                            "name": "Tile of Decarabian's Tower",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Debris of Decarabian's City",
//                            "drop_min": 0,
//                            "drop_max": 4
//                        },
//                        {
//                            "name": "Fragment of Decarabian's Epic",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Scattered Piece of Decarabian's Dream",
//                            "drop_min": 0,
//                            "drop_max": 1
//                        }
//                    ]
//                }
//            ]
//        },
//        {
//            "day": "fri",
//            "details": [
//                {
//                    "level": 1,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 10,
//                    "mora": 1125,
//                    "drops": [
//                        {
//                            "name": "Boreal Wolf's Milk Tooth",
//                            "drop_min": 4,
//                            "drop_max": 6
//                        }
//                    ]
//                },
//                {
//                    "level": 2,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 15,
//                    "mora": 1550,
//                    "drops": [
//                        {
//                            "name": "Boreal Wolf's Milk Tooth",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Boreal Wolf's Cracked Tooth",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        }
//                    ]
//                },
//                {
//                    "level": 3,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 15,
//                    "mora": 1850,
//                    "drops": [
//                        {
//                            "name": "Boreal Wolf's Milk Tooth",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Boreal Wolf's Cracked Tooth",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Boreal Wolf's Broken Fang",
//                            "drop_min": 0,
//                            "drop_max": 2
//                        }
//                    ]
//                },
//                {
//                    "level": 4,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 20,
//                    "mora": 2200,
//                    "items": [
//                        {
//                            "name": "Boreal Wolf's Milk Tooth",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Boreal Wolf's Cracked Tooth",
//                            "drop_min": 0,
//                            "drop_max": 4
//                        },
//                        {
//                            "name": "Boreal Wolf's Broken Fang",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Boreal Wolf's Nostalgia",
//                            "drop_min": 0,
//                            "drop_max": 1
//                        }
//                    ]
//                }
//            ]
//        },
//        {
//            "day": "sat",
//            "details": [
//                {
//                    "level": 1,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 10,
//                    "mora": 1125,
//                    "drops": [
//                        {
//                            "name": "Fetters of the Dandelion Gladiator",
//                            "drop_min": 4,
//                            "drop_max": 6
//                        }
//                    ]
//                },
//                {
//                    "level": 2,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 15,
//                    "mora": 1550,
//                    "drops": [
//                        {
//                            "name": "Fetters of the Dandelion Gladiator",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Chains of the Dandelion Gladiator",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        }
//                    ]
//                },
//                {
//                    "level": 3,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 15,
//                    "mora": 1850,
//                    "drops": [
//                        {
//                            "name": "Fetters of the Dandelion Gladiator",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Chains of the Dandelion Gladiator",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Shackles of the Dandelion Gladiator",
//                            "drop_min": 0,
//                            "drop_max": 2
//                        }
//                    ]
//                },
//                {
//                    "level": 4,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 20,
//                    "mora": 2200,
//                    "items": [
//                        {
//                            "name": "Fetters of the Dandelion Gladiator",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Chains of the Dandelion Gladiator",
//                            "drop_min": 0,
//                            "drop_max": 4
//                        },
//                        {
//                            "name": "Shackles of the Dandelion Gladiator",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Dream of the Dandelion Gladiator",
//                            "drop_min": 0,
//                            "drop_max": 1
//                        }
//                    ]
//                }
//            ]
//        },
//        {
//            "day": "sun",
//            "details": [
//                {
//                    "level": 1,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 10,
//                    "mora": 1125,
//                    "drops": [
//                        {
//                            "name": "Tile of Decarabian's Tower",
//                            "drop_min": 4,
//                            "drop_max": 6
//                        },
//                        {
//                            "name": "Boreal Wolf's Milk Tooth",
//                            "drop_min": 4,
//                            "drop_max": 6
//                        },
//                        {
//                            "name": "Fetters of the Dandelion Gladiator",
//                            "drop_min": 4,
//                            "drop_max": 6
//                        }
//                    ]
//                },
//                {
//                    "level": 2,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 15,
//                    "mora": 1550,
//                    "drops": [
//                        {
//                            "name": "Tile of Decarabian's Tower",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Debris of Decarabian's City",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Boreal Wolf's Milk Tooth",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Boreal Wolf's Cracked Tooth",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Fetters of the Dandelion Gladiator",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Chains of the Dandelion Gladiator",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        }
//                    ]
//                },
//                {
//                    "level": 3,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 15,
//                    "mora": 1850,
//                    "drops": [
//                        {
//                            "name": "Tile of Decarabian's Tower",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Debris of Decarabian's City",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Fragment of Decarabian's Epic",
//                            "drop_min": 0,
//                            "drop_max": 2
//                        },
//                        {
//                            "name": "Boreal Wolf's Milk Tooth",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Boreal Wolf's Cracked Tooth",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Boreal Wolf's Broken Fang",
//                            "drop_min": 0,
//                            "drop_max": 2
//                        },
//                        {
//                            "name": "Fetters of the Dandelion Gladiator",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Chains of the Dandelion Gladiator",
//                            "drop_min": 1,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Shackles of the Dandelion Gladiator",
//                            "drop_min": 0,
//                            "drop_max": 2
//                        }
//                    ]
//                },
//                {
//                    "level": 4,
//                    "adventureExperience": 100,
//                    "companionshipExperience": 20,
//                    "mora": 2200,
//                    "items": [
//                        {
//                            "name": "Tile of Decarabian's Tower",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Debris of Decarabian's City",
//                            "drop_min": 0,
//                            "drop_max": 4
//                        },
//                        {
//                            "name": "Fragment of Decarabian's Epic",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Scattered Piece of Decarabian's Dream",
//                            "drop_min": 0,
//                            "drop_max": 1
//                        },
//                        {
//                            "name": "Boreal Wolf's Milk Tooth",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Boreal Wolf's Cracked Tooth",
//                            "drop_min": 0,
//                            "drop_max": 4
//                        },
//                        {
//                            "name": "Boreal Wolf's Broken Fang",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Boreal Wolf's Nostalgia",
//                            "drop_min": 0,
//                            "drop_max": 1
//                        },
//                        {
//                            "name": "Fetters of the Dandelion Gladiator",
//                            "drop_min": 2,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Chains of the Dandelion Gladiator",
//                            "drop_min": 0,
//                            "drop_max": 4
//                        },
//                        {
//                            "name": "Shackles of the Dandelion Gladiator",
//                            "drop_min": 0,
//                            "drop_max": 3
//                        },
//                        {
//                            "name": "Dream of the Dandelion Gladiator",
//                            "drop_min": 0,
//                            "drop_max": 1
//                        }
//                    ]
//                }
//            ]
//        }
//    ]
//}
