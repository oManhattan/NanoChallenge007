//
//  ImageCardCentered.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 09/02/23.
//

import SwiftUI

enum ImageAlignment {
    case center, bottom
}

struct ImageCard<Content>: View where Content: View {
    
    private var title: String
    private var rarity: Int
    private var alignment: ImageAlignment
    private var image: () -> Content
    
    init(title: String, rarity: Int = 1, alignment: ImageAlignment = .center, @ViewBuilder image: @escaping () -> Content) {
        self.title = title
        self.rarity = rarity
        self.alignment = alignment
        self.image = image
    }
    
    var body: some View {
        switch alignment {
        case .center:
            RoundedRectangle(cornerRadius: 10)
                .overlay {
                    RarityBackground(rawValue: rarity)?.getBackground()
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .overlay(alignment: .center) {
                    image()
                }
                .overlay(alignment: .bottom) {
                    ZStack(alignment: .center) {
                        Rectangle()
                            .foregroundColor(.black)
                            .opacity(0.5)
                        Text(self.title)
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                            .lineLimit(2)
                            .minimumScaleFactor(0.5)
                            .padding(5)
                    }
                    .frame(maxHeight: 35)
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
        case .bottom:
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(uiColor: .systemGray))
                .overlay(alignment: .center) {
                    RarityBackground(rawValue: self.rarity)?.getBackground()
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .overlay(alignment: .bottom) {
                    VStack(spacing: 0) {
                        image()
                        ZStack(alignment: .center) {
                            Rectangle()
                                .foregroundColor(.black)
                                .opacity(0.5)
                            Text(self.title)
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold, design: .rounded))
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                                .padding(5)
                        }
                        .frame(maxHeight: 35)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct ImageCard_Previews: PreviewProvider {
    static var previews: some View {
        ImageCard(title: "Domains", rarity: 1) {
            Image("IconDomain")
        }
    }
}
