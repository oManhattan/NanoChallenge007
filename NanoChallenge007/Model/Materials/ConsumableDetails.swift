//
//  ConsumableDetails.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 14/02/23.
//

import SwiftUI

struct ConsumableDetails: View {
    
    private var reference: String
    private var consumable: FoodModel
    
    init(reference: String, consumable: FoodModel) {
        self.reference = reference
        self.consumable = consumable
    }
    
    var body: some View {
        ScrollView {
            DetailsProfileLayout(backgroundImageURL: "https://api.genshin.dev/consumables/food/\(reference)", profileImageURL: "https://api.genshin.dev/consumables/food/\(reference)") {
                VStack(spacing: 10) {
                    ContentBalloon {
                        VStack(spacing: 10) {
                            CustomTitleView(consumable.name)
                            ContentText(consumable.type)
                            StarRarity(amount: consumable.rarity)
                            ContentText(consumable.description, alignment: .leading)
                            CustomSeparator()
                            TitleDetail("Effect")
                            ContentText(consumable.effect, alignment: .leading)
                        }
                    }
                    if let ingredients = consumable.recipe {
                        ContentBalloon {
                            VStack(spacing: 10) {
                                CustomTitleView("Recipe")
                                ContentText("Cooking Ingredients")
                                CustomSeparator()
                                IngredientsGridList(references: ingredients)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Consumable Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct IngredientsGridList: View {
    
    @State private var ingredients: [CookingIngredientModel:Int] = [:]
    private var references: [RecipeItemModel]
    
    init(references: [RecipeItemModel]) {
        self.references = references
    }
    
    var body: some View {
        GridList(ingredients.sorted(by: {$0.value > $1.value}), numberOfColumns: 4, horizontalSpacing: 15) { element in
            VStack(spacing: 5) {
                ImageRoundedBackground(imageURL: "https://api.genshin.dev/materials/cooking-ingredients/\(element.key.name.formatToURL())", rarity: element.key.rarity ?? 1)
                ContentText("\(element.value)x")
            }
            .frame(height: CGFloat.getBounds().higher * 0.1)
        }
        .task {
            if
                let request = try? HTTPRequest.builder().path("https://api.genshin.dev/materials/cooking-ingredients").build(),
                let response = try? await request.send(),
                let json = try? JSONSerialization.jsonObject(with: response.data) as? [String:Any]
            {
                for i in json {
                    if
                        let item = references.filter({$0.item.formatToURL() == i.key}).first,
                        let value = i.value as? [String:Any],
                        let ingredient = CookingIngredientModel.decode(value)
                    {
                        self.ingredients[ingredient] = item.quantity
                    }
                }
            }
        }
    }
}
