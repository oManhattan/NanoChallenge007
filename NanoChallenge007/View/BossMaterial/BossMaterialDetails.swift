//
//  BossMaterialDetails.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 11/02/23.
//

import SwiftUI

struct BossMaterialDetails: View {
    
    private var reference: String
    private var bossMaterial: BossMaterialModel
    
    init(reference: String, bossMaterial: BossMaterialModel) {
        self.reference = reference
        self.bossMaterial = bossMaterial
    }
    
    var body: some View {
        DetailsProfileLayout(backgroundImageURL: "https://api.genshin.dev/materials/boss-material/\(reference)", profileImageURL: "https://api.genshin.dev/materials/boss-material/\(reference)") {
            VStack(spacing: 10) {
                ContentBalloon {
                    VStack(spacing: 15) {
                        CustomTitleView(bossMaterial.name)
                        ContentText("Boss material")
                        StarRarity(amount: 4)
                        CustomSeparator()
                        ContentText(bossMaterial.source)
                        CustomSeparator()
                        ContentText("Characters")
                        CharactersGridList(references: bossMaterial.characters)
                    }
                }
                Spacer()
            }
        }
        .navigationTitle("Boss Material details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BossMaterialDetails_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
