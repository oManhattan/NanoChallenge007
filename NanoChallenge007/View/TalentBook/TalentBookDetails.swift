//
//  TalentBookDetails.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 11/02/23.
//

import SwiftUI

struct TalentBookDetails: View {
    
    private var reference: String
    private var book: TalentBookModel
    private var bookCover: MaterialItemModel
    
    init(reference: String, book: TalentBookModel, bookCover: MaterialItemModel) {
        self.reference = reference
        self.book = book
        self.bookCover = bookCover
    }
    
    var body: some View {
        ScrollView {
            DetailsProfileLayout(backgroundImageURL: "https://api.genshin.dev/materials/talent-book/\(bookCover.id)", profileImageURL: "https://api.genshin.dev/materials/talent-book/\(bookCover.id)") {
                ContentBalloon {
                    VStack(spacing: 10) {
                        CustomTitleView(reference.capitalized)
                        ContentText("Talent Book")
                        CustomSeparator()
                        GridList(book.items, numberOfColumns: 3, horizontalSpacing: 20) { element in
                            ImageRoundedBackground(imageURL: "https://api.genshin.dev/materials/talent-book/\(bookCover.id)", rarity: element.rarity)
                                .frame(height: CGFloat.getBounds().higher * 0.1)
                        }
                        CustomSeparator()
                        ContentText("Characters")
                        CharactersGridList(references: book.characters)
                    }
                }
            }
        }
        .navigationTitle("Talent Book Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TalentBookDetails_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
