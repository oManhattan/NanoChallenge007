//
//  DefaultNavigationLink.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 02/02/23.
//

import SwiftUI

struct CustomNavigationLink1<Destination, AdjustedImage>: View where Destination: View, AdjustedImage: View {
    private var title: String
    private var imageURL: String
    private var rarity: Int
    private var destination: () -> Destination
    private var imageAdjustment: (_ image: Image) -> AdjustedImage
    
    init(title: String, imageURL: String, rarity: Int = 1, destination: @escaping () -> Destination, imageAdjustment: @escaping (_ image: Image) -> AdjustedImage) {
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
                .overlay {
                    RarityBackground(rawValue: rarity)?.getBackground()
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .overlay(alignment: .center) {
                    CustomAsyncImage(imageURL: self.imageURL) { image in
                        self.imageAdjustment(image)
                    } failedImage: {
                        Image("IconSword")
                    }
                }
                .overlay(alignment: .bottom) {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .foregroundColor(.black)
                            .opacity(0.5)
                        Text(self.title)
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .lineLimit(1)
                            .minimumScaleFactor(0.2)
                            .padding(.horizontal, 3)
                    }
                    .frame(maxHeight: 30)
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}
