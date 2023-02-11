//
//  CustomTitleView.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 07/02/23.
//

import SwiftUI

struct CustomTitleView: View {
    
    private let name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Rectangle()
                .rotation(.degrees(45))
                .frame(width: 5, height: 5)
                .foregroundColor(Color("InnerContent"))
            Text(name)
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(.white)
            Rectangle()
                .rotation(.degrees(45))
                .frame(width: 5, height: 5)
                .foregroundColor(Color("InnerContent"))
        }
    }
}


struct CustomTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ContentBackground")
                .ignoresSafeArea()
            CustomTitleView("Manhattan")
        }
    }
}
