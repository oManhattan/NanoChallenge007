//
//  EnemyDetails.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 14/02/23.
//

import SwiftUI

struct EnemyDetails: View {
    
    private var reference: String
    private var enemy: EnemyModel
    
    init(reference: String, enemy: EnemyModel) {
        self.reference = reference
        self.enemy = enemy
    }
    
    var body: some View {
        ScrollView {
            DetailsProfileLayout(backgroundImageURL:  "https://api.genshin.dev/enemies/\(reference)/icon", profileImageURL: "https://api.genshin.dev/enemies/\(reference)/icon") {
                VStack(spacing: 10) {
                    EnemyBasicDetails(reference: reference, enemy: enemy)
                    if let drops = enemy.drops {
                        EnemyDropsDetails(drops: drops)
                    }
                    if let artifacts = enemy.artifacts {
                        EnemyArtifactsDetails(enemyArtifacts: artifacts)
                    }
                    if let elements = enemy.elementalDescription {
                        EnemyElementalDetails(elements: elements)
                    }
                }
            }
        }
        .navigationTitle("Enemy Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EnemyBasicDetails: View {
    private var reference: String
    private var enemy: EnemyModel
    
    init(reference: String, enemy: EnemyModel) {
        self.reference = reference
        self.enemy = enemy
    }
    
    var body: some View {
        ContentBalloon {
            VStack(spacing: 10) {
                CustomTitleView(enemy.name)
                ContentText("\(enemy.family) - \(enemy.type)")
                if let description = enemy.description, description != "N/A" {
                    ContentText(description, alignment: .leading)
                }
                CustomSeparator()
                AsyncImageWithTitle(title: enemy.region.capitalized, imageURL: "https://api.genshin.dev/nations/\(enemy.region.lowercased())/icon", failedImage: {
                    Image("UnkownNation")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                })
                if let elements = enemy.elements {
                    CustomSeparator()
                    HStackLayout(spacing: 10) {
                        ForEach(elements, id: \.self) { element in
                            CustomAsyncImage(imageURL: "https://api.genshin.dev/elements/\(element.lowercased())/icon") { image in
                                image.resizable().aspectRatio(contentMode: .fit)
                            } failedImage: {
                                Image("UnkownNation").resizable().aspectRatio(contentMode: .fit)
                            }.frame(height: CGFloat.getBounds().higher * 0.08)
                            
                        }
                    }
                }
            }
        }
    }
}

struct EnemyDropsDetails: View {
    
    @State private var items: [MaterialItemModel] = []
    @State private var title: String = ""
    private var drops: [EnemyDropModel]
    
    init(drops: [EnemyDropModel]) {
        self.drops = drops
    }
    
    var body: some View {
        ContentBalloon {
            VStack(spacing: 10) {
                CustomTitleView(title.capitalized.replacingOccurrences(of: "-", with: " "))
                ContentText("Common Ascension")
                CustomSeparator()
                HStack(spacing: 20) {
                    ForEach(items, id: \.id) { item in
                        ImageRoundedBackground(imageURL: "https://api.genshin.dev/materials/common-ascension/\(item.id.replacingOccurrences(of: "'", with: "-"))", rarity: item.rarity)
                            .frame(height: CGFloat.getBounds().higher * 0.1)
                    }
                }
            }
        }
        .task {
            do {
                let requestMaterials = try HTTPRequest.builder().path("https://api.genshin.dev/materials/common-ascension").build()
                let (data, _) = try await requestMaterials.send()
                
                if let materials = try? JSONSerialization.jsonObject(with: data) as? [String:Any] {
                    for material in materials {
                        guard
                            let json = material.value as? [String:Any],
                            let commonAscension = CommonAscensionModel.decode(json),
                            commonAscension.items.contains(where: {$0.name == self.drops[0].name})
                        else { continue }
                        self.title = material.key
                        self.items = commonAscension.items
                        break
                    }
                }
            } catch { print(error) }
        }
    }
}

struct EnemyArtifactsDetails: View {
    
    private var enemyArtifacts: [EnemyArtifactDropModel]
    
    init(enemyArtifacts: [EnemyArtifactDropModel]) {
        self.enemyArtifacts = enemyArtifacts
    }
    
    var body: some View {
        ContentBalloon {
            VStack(spacing: 10) {
                CustomTitleView("Artifacts")
                ContentText("Drops")
                CustomSeparator()
                GridList(enemyArtifacts, numberOfColumns: 4, horizontalSpacing: 20) { element in
                    if let rarity: Int = element.rarity.split(separator: "/").map({return Int($0) ?? 0}).sorted(by: {$0 > $1}).first {
                        ImageRoundedBackground(imageURL: "https://api.genshin.dev/artifacts/\(element.set.lowercased().replacingOccurrences(of: " ", with: "-").replacingOccurrences(of: "'", with: "-"))/flower-of-life", rarity: rarity)
                            .frame(height: CGFloat.getBounds().higher * 0.1)
                    }
                }
            }
        }
    }
}

struct EnemyElementalDetails: View {
    private var elements: [EnemyElementModel]
    
    init(elements: [EnemyElementModel]) {
        self.elements = elements
    }
    
    var body: some View {
        ForEach(elements, id: \.element) { element in
            ContentBalloon {
                VStack(spacing: 10) {
                    CustomTitleView("Elemental Description")
                    ContentText(element.element)
                    ContentText(element.description, alignment: .leading)
                }
            }
            .overlay(alignment: .topTrailing) {
                CustomAsyncImage(imageURL: "https://api.genshin.dev/elements/\(element.element.lowercased())/icon") { image in
                    image.resizable().aspectRatio(contentMode: .fit)
                } failedImage: {
                    Image("UnkownNation").resizable().aspectRatio(contentMode: .fit)
                }
                .frame(height: CGFloat.getBounds().higher * 0.05)
                .padding()
            }
        }
    }
}

struct EnemyDetails_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
