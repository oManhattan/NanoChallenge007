//
//  CommonAscensionDetails.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 14/02/23.
//

import SwiftUI

struct CommonAscensionDetails: View {
    
    private var reference: String
    private var commonAscension: CommonAscensionModel
    private var imageURL: String
    
    init(reference: String, commonAscension: CommonAscensionModel, imageURL: String) {
        self.reference = reference
        self.commonAscension = commonAscension
        self.imageURL = imageURL
    }
    
    var body: some View {
        ScrollView {
            DetailsProfileLayout(backgroundImageURL: imageURL, profileImageURL: imageURL) {
                ContentBalloon {
                    VStack(spacing: 10) {
                        CustomTitleView(reference.capitalized.replacingOccurrences(of: "-", with: " "))
                        ContentText("Common Ascension")
                        CustomSeparator()
                        GridList(commonAscension.items, numberOfColumns: 4, horizontalSpacing: 15) { element in
                            ImageRoundedBackground(imageURL: "https://api.genshin.dev/materials/common-ascension/\(element.id.replacingOccurrences(of: "'", with: "-"))", rarity: element.rarity)
                                .frame(height: CGFloat.getBounds().higher * 0.08)
                        }
                        CustomSeparator()
                        TitleDetail("Sources")
                        GridList(commonAscension.sources, numberOfColumns: 4, horizontalSpacing: 15) { element in
                            CustomAsyncImage(imageURL: "https://api.genshin.dev/enemies/\(element.lowercased().replacingOccurrences(of: " ", with: "-"))/icon") { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .frame(height: CGFloat.getBounds().higher * 0.08)
                            } failedImage: {
                                Image("UnkownNation")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: CGFloat.getBounds().higher * 0.08)
                            }
                            
                        }
                        if let characters = commonAscension.characters {
                            CustomSeparator()
                            TitleDetail("Characters")
                            CharactersGridList(references: characters)
                        }
                        if let weapons = commonAscension.weapons {
                            CustomSeparator()
                            TitleDetail("Weapons")
                            WeaponsGridList(references: weapons)
                        }
                    }
                }
            }
        }
        .navigationTitle("Common Ascension Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CharactersGridList: View {
    
    @State private var characters: [CharacterModel:String] = [:]
    private var references: [String]
    
    init(references: [String]) {
        self.references = references
    }
    
    var body: some View {
        GridList(characters.sorted(by: {$0.value < $1.value}), numberOfColumns: 4, horizontalSpacing: 15) { character in
            ImageRoundedBackground(imageURL: "https://api.genshin.dev/characters/\(character.value.formatToURL())/icon", rarity: character.key.rarity)
                .frame(height: CGFloat.getBounds().higher * 0.08)
        }
        .task(priority: .high) {
            for reference in references {
                guard
                    let request = try? HTTPRequest.builder().path("https://api.genshin.dev/characters/\(reference.formatToURL())").build(),
                    let response = try? await request.send(),
                    let character = CharacterModel.decode(response.data)
                else { continue }
                self.characters[character] = reference
            }
        }
    }
}

struct WeaponsGridList: View {
    
    @State private var weapons: [WeaponModel:String] = [:]
    private var references: [String]
    
    init(references: [String]) {
        self.references = references
    }
    
    var body: some View {
        GridList(weapons.sorted(by: {$0.value < $1.value}), numberOfColumns: 4, horizontalSpacing: 15) { weapon in
            ImageRoundedBackground(imageURL: "https://api.genshin.dev/weapons/\(weapon.value.formatToURL())/icon", rarity: weapon.key.rarity)
                .frame(height: CGFloat.getBounds().higher * 0.08)
        }
        .task(priority: .high) {
            for reference in references {
                guard
                    let request = try? HTTPRequest.builder().path("https://api.genshin.dev/weapons/\(reference.formatToURL())").build(),
                    let response = try? await request.send(),
                    let weapon = WeaponModel.decode(response.data)
                else { continue }
                self.weapons[weapon] = reference
            }
        }
    }
}
