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
        GridList(Array(1...7), numberOfColumns: 3) { element in
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.orange)
                Text("\(element)")
            }
        }
        .padding(.horizontal)
    }
}
