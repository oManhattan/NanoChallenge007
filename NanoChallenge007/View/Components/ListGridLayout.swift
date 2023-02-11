//
//  ListGridLayout.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 09/02/23.
//

import SwiftUI

struct ListGridLayout<Content>: View where Content: View {
    private let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    private var content: () -> Content
    
    init(content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                content()
                    .frame(height: CGFloat.getBounds().higher * 0.22)
            }
            .padding(.horizontal)
        }
    }
}

struct ListGridLayout_Previews: PreviewProvider {
    static var previews: some View {
        ListGridLayout {
            ForEach(0..<10) { _ in
                AsyncImageCard(title: "Albedo", imageURL: "https://api.genshin.dev/characters/albedo/icon", rarity: 5, alignment: .bottom) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } failedImage: {
                    Image("UnkownDomain")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }

            }
        }
    }
}
