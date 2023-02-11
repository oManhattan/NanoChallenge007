//
//  ImageWithTitleView.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 07/02/23.
//

import SwiftUI

struct ImageWithTitleView: View {
    private var title: String
    private var image: Image
    
    init(title: String, image: Image) {
        self.title = title
        self.image = image
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Rectangle()
                .foregroundColor(Color.clear)
                .frame(height: CGFloat.getBounds().lower * 0.3)
                .overlay(alignment: .center) {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .medium, design: .rounded))
        }
    }
}

struct ImageWithTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ContentBalloon {
            ImageWithTitleView(title: "Sword", image: Image("IconSword"))
        }
        .padding(10)
    }
}
