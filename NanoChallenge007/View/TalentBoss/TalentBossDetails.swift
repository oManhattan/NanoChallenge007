//
//  TalentBossDetails.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 12/02/23.
//

import SwiftUI

struct TalentBossDetails: View {
    
    private var boss: TalentBossModel
    
    init(boss: TalentBossModel) {
        self.boss = boss
    }
    
    var body: some View {
        DetailsProfileLayout(backgroundImageURL: "https://api.genshin.dev/materials/talent-boss/\(boss.id)", profileImageURL: "https://api.genshin.dev/materials/talent-boss/\(boss.id)") {
            VStack(spacing: 0) {
                ContentBalloon {
                    VStack(spacing: 10) {
                        CustomTitleView(boss.name)
                        ContentText("Talent Boss")
                        StarRarity(amount: 5)
                        CustomSeparator()
                        ContentText("Characters")
                        CharactersGridList(references: boss.characters)
                    }
                }
                Spacer()
            }
        }
    }
}

struct TalentBossDetails_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
