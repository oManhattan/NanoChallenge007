//
//  ItemList.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 12/02/23.
//

import SwiftUI

struct ItemList<Element, CellContent>: View where CellContent: View {
    
    private var title: String
    private var items: Array<Element>
    private var cellInfo: (_ item: Element) -> CellContent
    
    init(title: String, items: Array<Element>, @ViewBuilder cellInfo: @escaping (_ item: Element) -> CellContent) {
        self.title = title
        self.items = items
        self.cellInfo = cellInfo
    }
    
    var body: some View {
        ScrollView {
            GridList(items, numberOfColumns: 3) { item in
                cellInfo(item)
            }
            .padding(.horizontal)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
