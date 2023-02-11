//
//  CharactersListVIew.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 09/02/23.
//

import SwiftUI

struct CharactersListVIew: View {
    @StateObject private var characterVM = CharactersViewModel()
    @State private var failedToLoadCharactersInformation: Bool = false
    
    var body: some View {
        ScrollView {
            GridList(characterVM.characters.sorted(by: {$0.key < $1.key}), numberOfColumns: 3) { character in
                NavigationLink {
                    CharacterDetailsView(reference: character.key, character: character.value)
                } label: {
                    AsyncImageCard(title: character.value.name, imageURL: "https://api.genshin.dev/characters/\(character.key)/card") { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.top, -30)
                    }
                }
                .frame(height: CGFloat.getBounds().higher * 0.22)
            }
            .padding(.horizontal)
        }
        .navigationTitle("Characters")
        .task(priority: .high) {
            do {
                try await self.characterVM.loadAllCharacters()
            } catch {
                self.failedToLoadCharactersInformation.toggle()
            }
        }
        .alert("Failed to load characters data", isPresented: $failedToLoadCharactersInformation, actions: {Button("Ok", role: .cancel, action: {})}, message: {Text("Try again later.")})
    }
}

struct CharactersListVIew_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListVIew()
    }
}
