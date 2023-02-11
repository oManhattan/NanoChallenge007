//
//  FoodModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

//"pile-em-up": {
//    "name": "\"Pile 'Em Up\"",
//    "rarity": 3,
//    "type": "ATK-Boosting Dish",
//    "effect": "Increases all party members' CRIT Rate by 10~20% for 300s.",
//    "hasRecipe": true,
//    "description": "A rich, meaty dish. Originally a Mondstadt dish made of steaks, potatoes, and cheese, it has since become synonymous with Ludi Harpastum.",
//    "proficiency": 15,
//    "recipe": [
//        {
//            "item": "Raw Meat",
//            "quantity": 3
//        },
//        {
//            "item": "Potato",
//            "quantity": 3
//        },
//        {
//            "item": "Small Lamp Grass",
//            "quantity": 1
//        },
//        {
//            "item": "Cheese",
//            "quantity": 1
//        }
//    ]
//}

struct FoodModel: JSONModel {
    var name: String
    var rarity: Int
    var type: String
    var effect: String
    var hasRecipe: Bool
    var description: String
    var proficiency: Int?
    var recipe: [RecipeItemModel]?
}
