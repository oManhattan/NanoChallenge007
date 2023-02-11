//
//  RoundItemWithBackground.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 07/02/23.
//

import SwiftUI

struct ImageRoundedBackground: View {
    
    private var imageURL: String
    private var rarity: Int
    
    init(imageURL: String, rarity: Int) {
        self.imageURL = imageURL
        self.rarity = rarity
    }
    
    var body: some View {
        Circle()
            .foregroundColor(Color(uiColor: .systemGray))
            .overlay(alignment: .center) {
                CustomAsyncImage(imageURL: imageURL) { image in
                    ZStack(alignment: .center) {
                        RarityBackground(rawValue: rarity)?
                            .getBackground()
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(5)
                    }
                } failedImage: {
                    Image("UnkownNation")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .clipShape(Circle())
    }
}

struct RoundItemWithBackground_Previews: PreviewProvider {
    static var previews: some View {
        ImageRoundedBackground(imageURL: "https://api.genshin.dev/materials/boss-material/hurricane-seed", rarity: 1)
            .padding()
    }
}
