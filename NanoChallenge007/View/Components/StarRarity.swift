//
//  StarRarity.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 11/02/23.
//

import SwiftUI

struct StarRarity: View {
    private var stars: Int
    
    init(amount stars: Int) {
        self.stars = stars
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: -4) {
            ForEach(0..<stars, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .renderingMode(.template)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct StarRarity_Previews: PreviewProvider {
    static var previews: some View {
        StarRarity(amount: 5)
    }
}
