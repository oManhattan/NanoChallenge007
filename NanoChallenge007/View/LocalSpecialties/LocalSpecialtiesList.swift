//
//  LocalSpecialtiesList.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 11/02/23.
//

import SwiftUI

struct LocalSpecialtiesList: View {
    
    @State private var localSpecialties: [LocalSpecialtiesModel:String] = [:]
    @State private var failedToLoadContent: Bool = false
    
    var body: some View {
        ScrollView {
            GridList(localSpecialties.sorted(by: {$0.key.name < $1.key.name}), numberOfColumns: 3) { element in
                AsyncImageCard(title: element.key.name, imageURL: "https://api.genshin.dev/materials/local-specialties/\(element.key.id)", rarity: 1, alignment: .bottom) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(height: CGFloat.getBounds().higher * 0.18)
            }
            .padding(.horizontal)
        }
        .navigationTitle("Local Specialties")
        .task {
            do {
                let request = try HTTPRequest.builder().path("https://api.genshin.dev/materials/local-specialties/").build()
                let (data, _) = try await request.send()
                if let json = try JSONSerialization.jsonObject(with: data) as? [String:Any] {
                    for key in json.keys {
                        guard let values = json[key] as? Array<[String:Any]> else { continue }
                        for value in values {
                            guard let material = LocalSpecialtiesModel.decode(value) else { continue }
                            self.localSpecialties[material] = key
                        }
                    }
                }
            } catch {
                failedToLoadContent.toggle()
            }
        }
    }
}

struct LocalSpecialtiesList_Previews: PreviewProvider {
    static var previews: some View {
        LocalSpecialtiesList()
    }
}
