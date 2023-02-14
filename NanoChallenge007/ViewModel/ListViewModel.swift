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
        case failedToLoadArtifacts = "Failed to load artifacts."
        case failedToConvertJsonToArtifact = "Failed to convert JSON to ArtifactModel"
    }
    
    @Published var bossMaterials: [BossMaterialModel:String] = [:]
    @Published var localSpecialties: [LocalSpecialtiesModel:String] = [:]
    @Published var talentBooks: [TalentBookModel:String] = [:]
    @Published var talentBosses: [TalentBossModel:String] = [:]
    @Published var artifacts: [ArtifactModel:String] = [:]
    @Published var weaponAscensions: [WeaponAscensionModel:String] = [:]
    @Published var weapons: [WeaponModel:String] = [:]
    @Published var enemies: [EnemyModel:String] = [:]
    @Published var commonAscensions: [CommonAscensionModel:String] = [:]
    @Published var consumables: [FoodModel:String] = [:]
    
    @MainActor func loadBossMaterials() async throws {
        let request = try HTTPRequest.builder().path("https://api.genshin.dev/materials/boss-material/").build()
        let (data, _) = try await request.send()
        if let json = data.jsonObject() {
            for element in json {
                guard let value = element.value as? [String:Any], let material = BossMaterialModel.decode(value) else { continue }
                self.bossMaterials[material] = element.key
            }
        }
    }
    
    @MainActor func loadLocalSpecialties() async throws {
        let request = try HTTPRequest.builder().path("https://api.genshin.dev/materials/local-specialties/").build()
        let (data, _) = try await request.send()
        if let json = data.jsonObject() {
            for key in json.keys {
                guard let values = json[key] as? Array<[String:Any]> else { continue }
                for value in values {
                    guard let material = LocalSpecialtiesModel.decode(value) else { continue }
                    self.localSpecialties[material] = key
                }
            }
        }
    }
    
    @MainActor func loadTalentBooks() async throws {
        let request = try HTTPRequest.builder().path("https://api.genshin.dev/materials/talent-book/").build()
        let (data, _) = try await request.send()
        if let json = data.jsonObject() {
            for i in json {
                guard
                    let value = i.value as? [String:Any],
                    let model = TalentBookModel.decode(value)
                else { continue }
                self.talentBooks[model] = i.key
            }
        }
    }
    
    @MainActor func loadTalentBosses() async throws {
        let request = try HTTPRequest.builder().path("https://api.genshin.dev/materials/talent-boss/").build()
        let (data, _) = try await request.send()
        if let json = data.jsonObject() {
            for i in json {
                guard let value = i.value as? [String:Any], let boss = TalentBossModel.decode(value) else { continue }
                self.talentBosses[boss] = i.key
            }
        }
    }
    
    @MainActor func loadArtifacts() async throws {
        let request = try HTTPRequest.builder().path("https://api.genshin.dev/artifacts").build()
        let (data, _) = try await request.send()
        guard let artifacts = Array<String>.decode(data) else {
            throw ListViewModelError.failedToLoadArtifacts
        }
        for artifact in artifacts {
            let request = try HTTPRequest.builder().path("https://api.genshin.dev/artifacts/\(artifact)").build()
            let (data, _) = try await request.send()
            guard let artifactModel = ArtifactModel.decode(data) else { continue }
            self.artifacts[artifactModel] = artifact
        }
    }
    
    @MainActor func loadWeaponAscensions() async throws {
        let request = try HTTPRequest.builder().path("https://api.genshin.dev/materials/weapon-ascension").build()
        let (data, _) = try await request.send()
        if let json = try JSONSerialization.jsonObject(with: data) as? [String:Any] {
            for i in json {
                guard let value = i.value as? [String:Any], let model = WeaponAscensionModel.decode(value) else { print("Deu ruim"); continue }
                self.weaponAscensions[model] = i.key
            }
        }
    }
    
    @MainActor func loadWeapons() async throws {
        let request = try HTTPRequest.builder().path("https://api.genshin.dev/weapons").build()
        let (data, _) = try await request.send()
        if let list = [String].decode(data) {
            for weaponReference in list {
                let formattedReference = weaponReference.replacingOccurrences(of: "'", with: "-")
                if
                    let request = try? HTTPRequest.builder().path("https://api.genshin.dev/weapons/\(formattedReference)").build(),
                    let (data, _) = try? await request.send(),
                    let weapon = WeaponModel.decode(data)
                {
                    self.weapons[weapon] = formattedReference
                }
            }
        }
    }
    
    @MainActor func loadEnemies() async throws {
        let request = try HTTPRequest.builder().path("https://api.genshin.dev/enemies").build()
        let (data, _) = try await request.send()
        if let list = [String].decode(data) {
            for enemyReference in list {
                if
                    let request = try? HTTPRequest.builder().path("https://api.genshin.dev/enemies/\(enemyReference)").build(),
                    let (data, _) = try? await request.send(),
                    let enemy = EnemyModel.decode(data)
                {
                    self.enemies[enemy] = enemyReference
                }
            }
        }
    }
    
    @MainActor func loadCommonAscension() async throws {
        let request = try HTTPRequest.builder().path("https://api.genshin.dev/materials/common-ascension").build()
        let (data, _) = try await request.send()
        if let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any] {
            for i in json {
                guard let value = i.value as? [String:Any], let material = CommonAscensionModel.decode(value) else { continue }
                self.commonAscensions[material] = i.key
            }
        }
    }
    
    @MainActor func loadConsumables() async throws {
        let request = try HTTPRequest.builder().path("https://api.genshin.dev/consumables/food/").build()
        let response = try await request.send()
        if let json = try? JSONSerialization.jsonObject(with: response.data) as? [String:Any] {
            for i in json {
                guard let value = i.value as? [String:Any], let food = FoodModel.decode(value) else { continue }
                self.consumables[food] = i.key
            }
        }
    }
}
