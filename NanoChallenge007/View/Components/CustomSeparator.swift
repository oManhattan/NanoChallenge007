//
//  CustomSeparator.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 07/02/23.
//

import SwiftUI

struct CustomSeparator: View {
    var body: some View {
        HStack(spacing: 10) {
            Rectangle()
                .rotation(.degrees(45))
                .frame(width: 5, height: 5)
            Rectangle()
                .frame(height: 2)
            Rectangle()
                .rotation(.degrees(45))
                .frame(width: 5, height: 5)
            Rectangle()
                .frame(height: 2)
            Rectangle()
                .rotation(.degrees(45))
                .frame(width: 5, height: 5)
        }
        .foregroundColor(Color("InnerContent"))
    }
}

struct CustomSeparator_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ForEach(0..<5) { _ in
                CustomSeparator()
                    .padding()
            }
        }
    }
}
