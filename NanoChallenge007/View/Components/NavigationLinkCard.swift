//
//  NavigationLinkCard.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 12/02/23.
//

import SwiftUI

struct NavigationLinkCard<Destination, AdjustedImage>: View where Destination: View, AdjustedImage: View {
    
    private var title: String
    private var imageURL: String
    private var rarity: Int
    private var imageAlignment: ImageAlignment
    private var height: CGFloat?
    private var destination: () -> Destination
    private var imageAdjustment: (_ image: Image) -> AdjustedImage
    
    init(title: String, imageURL: String, rarity: Int = 1, imageAlignment: ImageAlignment = .bottom, height: CGFloat? = nil, destination: @escaping () -> Destination, @ViewBuilder imageAdjustment: @escaping (_ image: Image) -> AdjustedImage) {
        self.title = title
        self.imageURL = imageURL
        self.rarity = rarity
        self.imageAlignment = imageAlignment
        self.height = height
        self.destination = destination
        self.imageAdjustment = imageAdjustment
    }
    
    var body: some View {
        NavigationLink {
            self.destination()
        } label: {
            AsyncImageCard(title: self.title, imageURL: self.imageURL, rarity: self.rarity, alignment: self.imageAlignment) { image in
                self.imageAdjustment(image)
            } failedImage: {
                self.imageAdjustment(Image("UnkownNation"))
            }
            .frame(height: self.height)
        }
    }
}

//struct NavigationLinkCard_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationLinkCard()
//    }
//}
