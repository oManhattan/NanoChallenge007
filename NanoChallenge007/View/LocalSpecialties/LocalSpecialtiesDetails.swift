//
//  LocalSpecialtiesDetails.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 11/02/23.
//

import SwiftUI

struct LocalSpecialtiesDetails: View {
    private var reference: String
    private var specialtie: LocalSpecialtiesModel
    
    init(reference: String, specialtie: LocalSpecialtiesModel) {
        self.reference = reference
        self.specialtie = specialtie
    }
    
    var body: some View {
        VStack(spacing: 0, content: {
            DetailsProfileLayout(backgroundImageURL: "https://api.genshin.dev/materials/local-specialties/\(specialtie.id)", profileImageURL: "https://api.genshin.dev/materials/local-specialties/\(specialtie.id)") {
                ContentBalloon {
                    VStackLayout(spacing: 10) {
                        CustomTitleView(specialtie.name)
                        ContentText("Local Specialtie")
                        CustomSeparator()
                        AsyncImageWithTitle(title: reference.capitalized, imageURL: "https://api.genshin.dev/nations/\(reference)/icon", failedImage: {
                            Image("UnkownNation")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        })
                        CustomSeparator()
                        ContentText("Characters")
                        GridList(specialtie.characters, numberOfColumns: 3, horizontalSpacing: 20) { character in
                            ImageRoundedBackground(imageURL: "https://api.genshin.dev/characters/\(character.lowercased())/icon", rarity: 5)
                                .frame(height: CGFloat.getBounds().higher * 0.1)
                        }
                    }
                }
            }
            Spacer()
        })
        .navigationTitle("Local Specialtie Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LocalSpecialtiesDetails_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
