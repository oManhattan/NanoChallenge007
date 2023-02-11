//
//  CharactersViewModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 01/02/23.
//

import Foundation
import SwiftUI

class CharactersViewModel: ObservableObject {
    
    @Published var characters: [String:CharacterModel]
    
    init() {
        self.characters = [:]
    }
    
    @MainActor func loadAllCharacters() async throws {
        let request = try HTTPRequest.builder()
            .path("https://api.genshin.dev/characters")
            .method(.GET)
            .timeoutInterval(5)
            .build()
        
        let (data, _) = try await request.send()
        
        guard let names = [String].decode(data) else {
            throw CharacterViewModelError.unableToLoadCharacterInformations
        }
        
        for name in names {
            self.characters[name] = try await loadCharacterInformations(name: name)
        }
    }
    
    @MainActor func loadCharacterInformations(name: String) async throws -> CharacterModel {
        let request = try HTTPRequest.builder()
            .path("https://api.genshin.dev/characters/\(name)")
            .method(.GET)
            .timeoutInterval(10)
            .build()
        
        let (data, _) = try await request.send()
        
        guard let characterInfo = CharacterModel.decode(data) else {
            throw CharacterViewModelError.unableToLoadCharacterInformations
        }
        
        return characterInfo
    }
    
    func loadCharacterAscensionMaterial(vision: String) async throws -> String {
        let request = try HTTPRequest.builder()
            .path("https://api.genshin.dev/materials/character-ascension")
            .build()
        let (data, _) = try await request.send()
        
        guard
            let elements = try JSONSerialization.jsonObject(with: data) as? [String:Any],
            let element = elements[vision] as? [String:Any],
            let sliver = element["sliver"] as? [String: Any],
            let id = sliver["id"] as? String
        else {
            throw CharacterViewModelError.failedToLoadCharacterMaterialAscension
        }
        
        return "https://api.genshin.dev/materials/character-ascension/\(id)"
    }
    
    func loadCommonAscensionMaterial(reference: String) async throws -> CommonAscensionModel {
        let request = try HTTPRequest.builder()
            .path("https://api.genshin.dev/materials/common-ascension/")
            .build()
        let (data, _) = try await request.send()
        
        guard
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any] else {
            throw CharacterViewModelError.failedToLoadCharacterMaterialAscension
        }
        for value in json.values {
            guard
                let materialsData = try? JSONSerialization.data(withJSONObject: value),
                let materialModel = CommonAscensionModel.decode(materialsData),
                let characters = materialModel.characters
            else { continue }
            if characters.contains(reference) { return materialModel }
        }
        throw CharacterViewModelError.failedToLoadCharacterMaterialAscension
    }
    
    func loadLocalSpecialtiesMaterial(reference: String) async throws -> LocalSpecialtiesModel {
        let request = try HTTPRequest.builder()
            .path("https://api.genshin.dev/materials/local-specialties")
            .build()
        let (data, _) = try await request.send()
        guard
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
        else { throw CharacterViewModelError.failedToLoadCharacterMaterialAscension }
        for value in json.values {
            guard
                let specialtiesJson = try? JSONSerialization.data(withJSONObject: value),
                let specialtiesModel = [LocalSpecialtiesModel].decode(specialtiesJson),
                let specialtie = specialtiesModel.filter({$0.characters.contains(reference)}).first
            else { continue }
            return specialtie
        }
        throw CharacterViewModelError.failedToLoadCharacterMaterialAscension
    }
    
    func loadBossMaterial(reference: String) async throws -> BossMaterialModel {
        let request = try HTTPRequest.builder()
            .path("https://api.genshin.dev/materials/boss-material")
            .build()
        let (data, _) = try await request.send()
        guard
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
        else { throw CharacterViewModelError.failedToLoadCharacterMaterialAscension }
        
        for value in json.values {
            guard let materialJson = try? JSONSerialization.data(withJSONObject: value),
                  let materialModel = BossMaterialModel.decode(materialJson)
            else { continue }
            if materialModel.characters.contains(reference) { return materialModel }
        }
        throw CharacterViewModelError.failedToLoadCharacterMaterialAscension
    }
    
    func loadTalentBook(reference: String) async throws -> String {
        let request = try HTTPRequest.builder().path("https://api.genshin.dev/materials/talent-book").build()
        let (data, _) = try await request.send()
        guard
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
        else { throw CharacterViewModelError.failedToLoadCharacterMaterialAscension }
        
        for value in json.values {
            guard
                let talentBookJson = try? JSONSerialization.data(withJSONObject: value),
                let talentBookModel = TalentBookModel.decode(talentBookJson)
            else {continue }
            if talentBookModel.characters.contains(reference) {
                guard let firstItem = talentBookModel.items.sorted(by: {$0.rarity < $1.rarity}).first else { return "" }
                return "https://api.genshin.dev/materials/talent-book/\(firstItem.id)"
            }
        }
        throw CharacterViewModelError.failedToLoadCharacterMaterialAscension
    }
    
    func loadTalentBoss(reference: String) async throws -> String {
        let request = try HTTPRequest.builder().path("https://api.genshin.dev/materials/talent-boss").build()
        let (data, _) = try await request.send()
        guard
            let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any]
        else { throw CharacterViewModelError.failedToLoadCharacterMaterialAscension }
        for value in json.values {
            guard let talentBossJson = try? JSONSerialization.data(withJSONObject: value),
                  let talentBossModel = TalentBossModel.decode(talentBossJson)
            else { continue }
            if talentBossModel.characters.contains(reference) {
                return "https://api.genshin.dev/materials/talent-boss/\(talentBossModel.id)".replacingOccurrences(of: "'", with: "-")
            }
        }
        throw CharacterViewModelError.failedToLoadCharacterMaterialAscension
    }
    
    enum CharacterViewModelError: Error {
        case unableToLoadCharacterInformations
        case failedToLoadCharacterMaterialAscension
    }
}
