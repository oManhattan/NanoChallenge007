//
//  DomainsList.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 14/02/23.
//

import SwiftUI

struct DomainsList: View {
    
    @StateObject private var domainvm = DomainViewModel()
    
    var body: some View {
        ItemList(title: "Domains", items: domainvm.domains, numberOfColumns: 1) { item in
            NavigationLink {
                DomainDetails(domain: item.domain, images: item.images, domainViewModel: domainvm)
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .overlay(alignment: .center) {
                            RarityBackground(rawValue: 5)?.getBackground().resizable().aspectRatio(contentMode: .fill)
                        }
                        .overlay(alignment: .center) {
                            VStack {
                                GridList(item.images, numberOfColumns: item.images.count > 0 ? item.images.count : 4) { element in
                                    CustomAsyncImage(imageURL: element) { image in
                                        image.resizable().aspectRatio(contentMode: .fit)
                                    } failedImage: {
                                        Image("UnkownNation").resizable().aspectRatio(contentMode: .fit)
                                    }.frame(width: CGFloat.getBounds().lower * 0.22)
                                }.padding(.horizontal)
                                ZStack(alignment: .center) {
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .opacity(0.5)
                                    Text(item.domain.name)
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                                        .lineLimit(2)
                                        .minimumScaleFactor(0.5)
                                        .padding(5)
                                }
                                .frame(maxHeight: 35)
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }.frame(height: CGFloat.getBounds().higher * 0.18)
            }
        }
        .task {
            do {
                try await domainvm.loadDomains()
            } catch { print(error) }
        }
    }
}

struct DomainsList_Previews: PreviewProvider {
    static var previews: some View {
        DomainsList()
    }
}

class DomainViewModel: ObservableObject {
    
    @Published var domains: [(domain: DomainModel, images: [String])] = []
    
    func loadWeaponAscensionsList() async throws -> [String] {
        let request = try HTTPRequest.builder().path("https://api.genshin.dev/materials/weapon-ascension").build()
        let response = try await request.send()
        guard let json = try? JSONSerialization.jsonObject(with: response.data) as? [String:Any] else { return [] }
        return json.map({$0.key})
    }
    
    func loadArtifactsList() async throws -> [String] {
        let request = try HTTPRequest.builder().path("https://api.genshin.dev/artifacts").build()
        let response = try await request.send()
        guard let list = [String].decode(response.data) else { return [] }
        return list
    }
    
    @MainActor func loadDomains() async throws {
        let request = try HTTPRequest.builder().path("https://api.genshin.dev/domains").build()
        let response = try await request.send()
        guard let domainsList = [String].decode(response.data) else { return }
        var aux: [(domain: DomainModel, images: [String])] = []
        for domainReference in domainsList {
            let domainRequest = try HTTPRequest.builder().path("https://api.genshin.dev/domains/\(domainReference)").build()
            let domainResponse = try await domainRequest.send()
            guard let domain = DomainModel.decode(domainResponse.data) else { continue }
            aux.append((domain, getDomainImages(domain: domain)))
        }
        self.domains = aux
    }
    
    private func getDomainImages(domain: DomainModel) -> [String] {
        if domain.name.formatToURL() == "cecilia-garden" {
            return ["https://api.genshin.dev/materials/weapon-ascension/scattered-piece-of-decarabian-s-dream",
                    "https://api.genshin.dev/materials/weapon-ascension/dream-of-the-dandelion-gladiator",
                    "https://api.genshin.dev/materials/weapon-ascension/boreal-wolf-s-nostalgia"]
        } else if domain.name.formatToURL() == "hidden-palace-of-lianshan-formula" {
            return ["https://api.genshin.dev/materials/weapon-ascension/divine-body-from-guyun",
                    "https://api.genshin.dev/materials/weapon-ascension/mist-veiled-primo-elixir",
                    "https://api.genshin.dev/materials/weapon-ascension/chunk-of-aerosiderite"]
        } else if domain.name.formatToURL() == "domain-of-guyun" {
            return ["https://api.genshin.dev/artifacts/lucky-dog/flower-of-life",
                    "https://api.genshin.dev/artifacts/brave-heart/flower-of-life",
                    "https://api.genshin.dev/artifacts/archaic-petra/flower-of-life",
                    "https://api.genshin.dev/artifacts/retracing-bolide/flower-of-life"]
        } else if domain.name.formatToURL() == "midsummer-courtyard" {
            return ["https://api.genshin.dev/artifacts/resolution-of-sojourner/flower-of-life",
                    "https://api.genshin.dev/artifacts/adventurer/flower-of-life",
                    "https://api.genshin.dev/artifacts/thundering-fury/flower-of-life",
                    "https://api.genshin.dev/artifacts/thundersoother/flower-of-life"]
        }
        return []
    }
    
    /**
     // hidden place
     https://api.genshin.dev/materials/weapon-ascension/divine-body-from-guyun
     https://api.genshin.dev/materials/weapon-ascension/mist-veiled-primo-elixir
     https://api.genshin.dev/materials/weapon-ascension/chunk-of-aerosiderite
     
     // cecilia garden
     https://api.genshin.dev/materials/weapon-ascension/scattered-piece-of-decarabian-s-dream
     https://api.genshin.dev/materials/weapon-ascension/dream-of-the-dandelion-gladiator
     https://api.genshin.dev/materials/weapon-ascension/boreal-wolf-s-nostalgia
     
     // domain of guyun
     https://api.genshin.dev/artifacts/lucky-dog/flower-of-life
     https://api.genshin.dev/artifacts/brave-heart/flower-of-life
     https://api.genshin.dev/artifacts/archaic-petra/flower-of-life
     https://api.genshin.dev/artifacts/retracing-bolide/flower-of-life
     
     // Midsummer Courtyard
     https://api.genshin.dev/artifacts/resolution-of-sojourner/flower-of-life
     https://api.genshin.dev/artifacts/adventurer/flower-of-life
     https://api.genshin.dev/artifacts/thundering-fury/flower-of-life
     https://api.genshin.dev/artifacts/thundersoother/flower-of-life
     */
    
    func getRewardItems(domain: DomainModel) async throws -> [String] {
        guard
            let (rewards, category) = getRewardsOfTheDay(domain: domain),
            let details = rewards.details.sorted(by: {$0.level > $1.level}).first,
            let items = details.items
        else { fatalError() }
        
        if category == "artifacts" {
            return items.map({"https://api.genshin.dev/\(category)/\($0.name.formatToURL())/flower-of-life"})
        } else {
            let request = try HTTPRequest.builder().path("https://api.genshin.dev/materials/weapon-ascension").build()
            let (data, _) = try await request.send()
            if let json = try JSONSerialization.jsonObject(with: data) as? [String:Any] {
                for i in json {
                    guard
                        let value = i.value as? [String:Any],
                        let model = WeaponAscensionModel.decode(value),
                        let firstReward = items.first,
                        model.items.contains(where: {$0.name.formatToURL() == firstReward.name.formatToURL()})
                    else { continue }
                    return items.map({"https://api.genshin.dev/\(category)/\($0.name.formatToURL())"})
                }
            }
        }
        return []
    }
    
    private func getRewardsOfTheDay(domain: DomainModel) -> (rewards: DomainReward, category: String)? {
        if let rewards = domain.rewards.filter({$0.day == "always"}).first {
            return (rewards, "artifacts")
        } else if let rewards = domain.rewards.filter({$0.day == Date().dayOfWeek().lowercased()}).first {
            return (rewards, "materials/weapon-ascension")
        }
        return nil
    }
}
