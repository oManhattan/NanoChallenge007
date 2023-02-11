//
//  ItemListView.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 11/02/23.
//

import SwiftUI

struct BossMaterialList: View {
    
    @State private var items: [String:BossMaterialModel] = [:]
    @State private var failedToLoadContent: Bool = false
    
    var body: some View {
        ScrollView {
            GridList(Array(items.sorted(by: {$0.key < $1.key})), numberOfColumns: 3) { element in
                NavigationLink {
                    BossMaterialDetails(reference: element.key, bossMaterial: element.value)
                } label: {
                    AsyncImageCard(title: element.value.name, imageURL: "https://api.genshin.dev/materials/boss-material/\(element.key)", rarity: 4, alignment: .bottom) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } failedImage: {
                        Image("UnkownNation")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(height: CGFloat.getBounds().higher * 0.18)
                }

            }
            .padding(.horizontal)
        }
        .navigationTitle("Boss Materials")
        .task {
            do {
                let request = try HTTPRequest.builder().path("https://api.genshin.dev/materials/boss-material/").build()
                let (data, _) = try await request.send()
                if let json = try JSONSerialization.jsonObject(with: data) as? [String:Any] {
                    for element in json {
                        guard let materialData = try? JSONSerialization.data(withJSONObject: element.value),
                              let materialModel = BossMaterialModel.decode(materialData) else { print("Não deu certo"); continue }
                        self.items[element.key] = materialModel
                    }
                }
            } catch {
                failedToLoadContent.toggle()
            }
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        BossMaterialList()
    }
}
