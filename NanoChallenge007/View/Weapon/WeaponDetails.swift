//
//  WeaponDetails.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 13/02/23.
//

import SwiftUI

struct WeaponDetails: View {
    
    private var reference: String
    private var weapon: WeaponModel
    
    init(reference: String, weapon: WeaponModel) {
        self.reference = reference
        self.weapon = weapon
    }
    
    var body: some View {
        ScrollView {
            DetailsProfileLayout(backgroundImageURL: "https://api.genshin.dev/weapons/\(reference)/icon", profileImageURL: "https://api.genshin.dev/weapons/\(reference)/icon") {
                VStack(spacing: 10) {
                    WeaponBaseDescription(weapon: weapon)
                }
            }
        }
        .navigationTitle("Weapon Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WeaponBaseDescription: View {
    
    private var weapon: WeaponModel
    
    init(weapon: WeaponModel) {
        self.weapon = weapon
    }
    
    var body: some View {
        ContentBalloon {
            VStack(spacing: 10) {
                CustomTitleView(weapon.name ?? "?")
                ContentText(weapon.type)
                StarRarity(amount: weapon.rarity)
                CustomSeparator()
                HStack {
                    VStack(spacing: 10) {
                        TitleDetail("Base Attack")
                        if let attack = weapon.baseAttack { ContentText("\(attack)") } else { ContentText("?") }
                    }
                    Spacer()
                    VStack(spacing: 10) {
                        TitleDetail("Sub Stats")
                        ContentText(weapon.subStat)
                    }
                }
                CustomSeparator()
                TitleDetail(weapon.passiveName, alignment: .leading)
                ContentText(weapon.passiveDesc, alignment: .leading)
            }
        }
    }
}

struct WeaponDetails_Previews: PreviewProvider {
    static var previews: some View {
//        WeaponDetails()
        EmptyView()
    }
}
