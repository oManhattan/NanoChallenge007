//
//  ImageCardCentered.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 09/02/23.
//

import SwiftUI

struct AsyncImageCard<SuccessImage, FailedImage>: View where SuccessImage: View, FailedImage: View {
    private var title: String
    private var imageURL: String
    private var rarity: Int
    private var alignment: ImageAlignment
    private var successImage: (_ image: Image) -> SuccessImage
    private var failedImage: () -> FailedImage
    
    init(title: String, imageURL: String, rarity: Int = 1, alignment: ImageAlignment = .center, successImage: @escaping (_ image: Image) -> SuccessImage, failedImage: @escaping () -> FailedImage = {Image("UnkownNation")}) {
        self.title = title
        self.imageURL = imageURL
        self.rarity = rarity
        self.alignment = alignment
        self.successImage = successImage
        self.failedImage = failedImage
    }
    
    var body: some View {
        ImageCard(title: title, rarity: rarity, alignment: alignment) {
            CustomAsyncImage(imageURL: self.imageURL) { image in
                successImage(image)
            } failedImage: {
                failedImage()
            }
        }
    }
}

struct AsyncImageCardCentered_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageCard(title: "Albedo", imageURL: "https://api.genshin.dev/characters/albedo/icon", rarity: 5, alignment: .bottom) { image in
            image
        }
    }
}
