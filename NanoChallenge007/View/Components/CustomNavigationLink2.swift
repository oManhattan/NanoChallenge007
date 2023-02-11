//
//  CustomNavigationLink2.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 06/02/23.
//

import SwiftUI

struct CustomNavigationLink2<Destination, AdjustedImage>: View where Destination: View, AdjustedImage: View {
    private var title: String
    private var imageURL: String
    private var rarity: Int
    private var destination: () -> Destination
    private var imageAdjustment: (_ image: Image) -> AdjustedImage
    
    init(title: String, imageURL: String, rarity: Int, destination: @escaping () -> Destination, imageAdjustment: @escaping (_ image: Image) -> AdjustedImage) {
        self.title = title
        self.imageURL = imageURL
        self.destination = destination
        self.rarity = rarity
        self.imageAdjustment = imageAdjustment
    }
    
    var body: some View {
        NavigationLink {
            self.destination()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(uiColor: .systemGray))
                .overlay(alignment: .center) {
                    RarityBackground(rawValue: self.rarity)?.getBackground()
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .overlay(alignment: .bottom) {
                    VStack(spacing: 0) {
                        CustomAsyncImage(imageURL: imageURL) { image in
                            self.imageAdjustment(image)
                        } failedImage: {
                            Image("IconSword")
                        }
                        ZStack(alignment: .center) {
                            Rectangle()
                                .foregroundColor(.black)
                                .opacity(0.5)
                            Text(self.title)
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold, design: .rounded))
                        }
                        .frame(maxHeight: 30)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}


struct CustomNavigationLink2_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationLink2(title: "Alguma coisa", imageURL: "https://api.genshin.dev/characters/traveler-anemo/icon-big-lumine", rarity: 5) {
            EmptyView()
        } imageAdjustment: { image in
            image
        }
        
    }
}
