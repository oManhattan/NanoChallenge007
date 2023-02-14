//
//  WeaponAscensionDetails.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 13/02/23.
//

import SwiftUI

struct WeaponAscensionDetails: View {
    
    private var reference: String
    private var weaponAscension: WeaponAscensionModel
    private var weaponAscensionImage: String
    
    init(reference: String, weaponAscension: WeaponAscensionModel, weaponAscensionImage: String) {
        self.reference = reference
        self.weaponAscension = weaponAscension
        self.weaponAscensionImage = weaponAscensionImage
    }
    
    var body: some View {
        ScrollView {
            DetailsProfileLayout(backgroundImageURL: weaponAscensionImage, profileImageURL: weaponAscensionImage) {
                ContentBalloon {
                    VStack(spacing: 10) {
                        CustomTitleView(self.reference.capitalized.replacingOccurrences(of: "-", with: " "))
                        ContentText("Weapon Ascension")
                        CustomSeparator()
                        GridList(weaponAscension.items, numberOfColumns: 4, horizontalSpacing: 10) { element in
                            ImageRoundedBackground(imageURL: "https://api.genshin.dev/materials/weapon-ascension/\(element.id.replacingOccurrences(of: "'", with: "-"))", rarity: element.rarity)
                                .frame(height: CGFloat.getBounds().higher * 0.1)
                        }
                        CustomSeparator()
                        TitleDetail(weaponAscension.source.capitalized.replacingOccurrences(of: "-", with: " "))
                        GridList(weaponAscension.availability, numberOfColumns: 3, horizontalSpacing: 20) { element in
                            ContentText(element)
                        }
                        CustomSeparator()
                        TitleDetail("Weapons")
                        WeaponsGridList(references: weaponAscension.weapons)
                    }
                }
            }
        }
        .navigationTitle("Weapon Ascesion Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct WeaponAscensionDetails_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
