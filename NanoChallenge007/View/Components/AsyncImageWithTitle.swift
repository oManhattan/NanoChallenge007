//
//  ImageWithTitle.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 07/02/23.
//

import SwiftUI

struct AsyncImageWithTitle<FailedImage>: View where FailedImage: View {
    
    private var title: String
    private var imageURL: String
    private var failedImage: () -> FailedImage
    
    init(title: String, imageURL: String, failedImage: @escaping () -> FailedImage) {
        self.title = title
        self.imageURL = imageURL
        self.failedImage = failedImage
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Rectangle()
                .foregroundColor(Color.clear)
                .frame(height: CGFloat.getBounds().lower * 0.3)
                .overlay(alignment: .center) {
                    CustomAsyncImage(imageURL: imageURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } failedImage: {
                        failedImage()
                    }
                }
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .medium, design: .rounded))
        }
    }
}

struct ImageWithTitle_Previews: PreviewProvider {
    static var previews: some View {
        ContentBalloon {
            AsyncImageWithTitle(title: "Albedo", imageURL: "https://api.genshin.dev/characters/albedo/icon-big", failedImage: {
                Image("IconSword")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            })
                .padding()
        }
        .padding()
    }
}
