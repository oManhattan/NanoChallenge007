//
//  CharacterConstellationView.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 10/02/23.
//

import SwiftUI

struct CharacterConstellationView: View {
    private var reference: String
    private var character: CharacterModel
    
    init(reference: String, character: CharacterModel) {
        self.reference = reference
        self.character = character
    }
    
    var body: some View {
        ScrollView {
            DetailsProfileLayout(backgroundImageURL: "https://api.genshin.dev/characters/\(reference)/gacha-splash", profileImageURL: "https://api.genshin.dev/characters/\(reference)/portrait") {
                VStack(spacing: 10) {
                    ForEach(Array(character.constellations.sorted(by: {$0.level < $1.level}).enumerated()), id: \.element) { index, constellation in
                        ContentBalloon {
                            VStack() {
                                DetailHeader(imageURL: "https://api.genshin.dev/characters/\(reference)/constellation-\(constellation.level)", title: constellation.name, subtitle: constellation.unlock, alignment: index % 2 == 0 ? .leading : .trailing)
                                CustomSeparator()
                                ContentText(constellation.description, alignment: .leading)
                            }
                        }
                    }
                }
                .padding(.top, -130)
            }
        }
        .navigationTitle("Constellations")
    }
}

struct CharacterConstellationView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
