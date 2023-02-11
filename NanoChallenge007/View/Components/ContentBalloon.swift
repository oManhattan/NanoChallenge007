//
//  ContentBalloon.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 07/02/23.
//

import SwiftUI

struct ContentBalloon<Content>: View where Content: View {
    private var content: () -> Content
    
    init(_ content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("ContentBackground"))
            VStack() {
                content()
                    .padding()
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct ContentBalloon_Previews: PreviewProvider {
    static var previews: some View {
        ContentBalloon {
            Text("Hello World")
                .padding()
        }
        .padding()
    }
}
