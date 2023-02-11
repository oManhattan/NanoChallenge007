//
//  ListsViewModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 07/02/23.
//

import Foundation

enum ListOption: String {
    case characters
    case bossMaterial = "materials/boss-material"
    case localSpecialities = "materials/local-specialties"
    case talentBook = "materials/talent-book"
    case talentBoss = "materials/talent-boss"
    case artifacts
    case weaponAscention = "weapon-ascension"
    case weapons
    case enemies
    case commonAscention = "common-ascension"
    case domains
    case consumables
}

class ListViewModel: ObservableObject {
    
    enum ListViewModelError: String, Error {
        case couldNotLoadList = "Failed to load the list."
    }
    
    @Published var list: [String] = []
    
    @MainActor func loadListItems(_ option: ListOption) async throws {
        let request = try HTTPRequest.builder()
            .path("https://api.genshin.dev/\(option.rawValue)")
            .method(.GET)
            .timeoutInterval(5)
            .build()
        
        let (data, _) = try await request.send()
        
        guard let list = [String].decode(data) else {
            throw ListViewModelError.couldNotLoadList
        }
        
        self.list = list
    }
}
