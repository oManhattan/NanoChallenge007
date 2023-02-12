//
//  GridListVIew.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 10/02/23.
//

import SwiftUI

struct GridList<Element, Content>: View where Content: View {
    
    private var array: Array<Element>
    private var numberOfColumns: Int
    private var content: (_ element: Element) -> Content
    private var horizontalSpacing: CGFloat?
    private var verticalSpacing: CGFloat?
    
    init(_ array: Array<Element>, numberOfColumns: Int = 2, horizontalSpacing: CGFloat? = nil, verticalSpacing: CGFloat? = nil, @ViewBuilder content: @escaping (_ element: Element) -> Content) {
        self.array = array
        self.numberOfColumns = numberOfColumns
        self.content = content
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
    }
    
    var body: some View {
        Grid(horizontalSpacing: horizontalSpacing, verticalSpacing: verticalSpacing) {
            ForEach(Array(stride(from: 0, to: array.count, by: numberOfColumns)), id: \.self) { index in
                GridRow {
                    ForEach(0..<numberOfColumns, id: \.self) { j in
                        if let element = array.getElementAt(index + j) {
                            content(element)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct GridList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            GridList(Array<String>(repeating: "Manhattan", count: 23), numberOfColumns: 2) { element in
                ImageCard(title: element, rarity: 5, alignment: .center) {
                    Image("UnkownNation")
                }
                .frame(minHeight: CGFloat.getBounds().higher * 0.15)
            }
            .padding(.horizontal)
        }
    }
}
