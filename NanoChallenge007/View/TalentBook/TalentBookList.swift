//
//  TalentBookList.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 11/02/23.
//

import SwiftUI

struct TalentBookList: View {
    
    @State private var books: [String:TalentBookModel] = [:]
    
    var body: some View {
        ScrollView {
            GridList(books.sorted(by: {$0.key < $1.key}), numberOfColumns: 3) { element in
                if let book = element.value.items.sorted(by: {$0.rarity > $1.rarity}).first {
                    NavigationLink {
                        TalentBookDetails(reference: element.key, book: element.value, bookCover: book)
                    } label: {
                        AsyncImageCard(title: element.key.capitalized, imageURL: "https://api.genshin.dev/materials/talent-book/\(book.id)", rarity: book.rarity, alignment: .bottom) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(height: CGFloat.getBounds().higher * 0.18)
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Talent Books")
        .task {
            do {
                let request = try HTTPRequest.builder().path("https://api.genshin.dev/materials/talent-book/").build()
                let (data, _) = try await request.send()
                if let json = data.jsonObject() {
                    for i in json {
                        guard
                            let value = i.value as? [String:Any],
                            let model = TalentBookModel.decode(value)
                        else { continue }
                        self.books[i.key] = model
                    }
                }
                
            } catch { print(error) }
        }
    }
}

struct TalentBookList_Previews: PreviewProvider {
    static var previews: some View {
        TalentBookList()
    }
}
