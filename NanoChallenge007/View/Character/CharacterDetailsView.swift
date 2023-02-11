//
//  CharacterDetailsView.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 01/02/23.
//

import SwiftUI

struct CharacterDetailsView: View {
    
    @State private var ascensionMaterials: [String:Int] = [:]
    @State private var talentMaterials: [String:Int] = [:]
    private var reference: String
    private var character: CharacterModel
    
    init(reference: String, character: CharacterModel) {
        self.reference = reference
        self.character = character
    }
    
    var body: some View {
        ScrollView {
            DetailsProfileLayout(backgroundImageURL: "https://api.genshin.dev/characters/\(reference)/gacha-splash", profileImageURL: "https://api.genshin.dev/characters/\(reference)/icon-big") {
                VStack(spacing: 10) {
                    ContentBalloon {
                        CharacterDetailsContent(character: character)
                    }
                    ContentBalloon {
                        VStack {
                            CustomTitleView("Ascention Material")
                            Text("Materials")
                                .foregroundColor(.white)
                            CustomSeparator()
                            HStack {
                                ForEach(ascensionMaterials.sorted(by: {$0.value > $1.value}), id: \.key) { material in
                                    ImageRoundedBackground(imageURL: material.key, rarity: material.value)
                                }
                            }
                            .frame(height: CGFloat.getBounds().higher * 0.085)
                            .padding(.top, 5)
                        }
                    }
                    ContentBalloon {
                        VStack {
                            CustomTitleView("Talent Material")
                            Text("Materials")
                                .foregroundColor(.white)
                            CustomSeparator()
                            HStack {
                                ForEach(talentMaterials.sorted(by: {$0.value > $1.value}), id: \.key) { material in
                                    ImageRoundedBackground(imageURL: material.key, rarity: material.value)
                                }
                            }
                            .frame(height: CGFloat.getBounds().higher * 0.085)
                            .padding(.top, 5)
                        }
                    }
                    CharacterNavigationLink(title: "Show Talents", imageURL: "https://api.genshin.dev/characters/\(reference)/talent-burst") {
                        CharacterTalentView(reference: reference, character: character)
                    }
                    CharacterNavigationLink(title: "Show Constellations", imageURL: "https://api.genshin.dev/characters/\(reference)/constellation-3") {
                        CharacterConstellationView(reference: reference, character: character)
                    }
                }
            }
        }
        .navigationTitle("Character details")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            let vm = CharactersViewModel()
            do {
                let characterAscension = try await vm.loadCharacterAscensionMaterial(vision: character.visionKey.lowercased())
                ascensionMaterials[characterAscension] = 1
            } catch { print(error) }
            
            do {
                let commonAscension = try await vm.loadCommonAscensionMaterial(reference: reference)
                if let firstMaterial = commonAscension.items.sorted(by: {$0.rarity < $1.rarity}).first {
                    ascensionMaterials["https://api.genshin.dev/materials/common-ascension/\(firstMaterial.id)"] = firstMaterial.rarity
                    talentMaterials["https://api.genshin.dev/materials/common-ascension/\(firstMaterial.id)"] = firstMaterial.rarity
                }
            } catch { print(error) }
            
            do {
                let localSpecialtie = try await vm.loadLocalSpecialtiesMaterial(reference: reference)
                ascensionMaterials["https://api.genshin.dev/materials/local-specialties/\(localSpecialtie.id)"] = 1
            } catch { print(error) }

            do {
                let bossMaterial = try await vm.loadBossMaterial(reference: reference)
                ascensionMaterials["https://api.genshin.dev/materials/boss-material/\(bossMaterial.name.lowercased().replacingOccurrences(of: " ", with: "-").replacingOccurrences(of: "'", with: "-"))"] = 1
            } catch { print(error) }
            
            do {
                let talentBook = try await vm.loadTalentBook(reference: reference)
                talentMaterials[talentBook] = 1
            } catch { print(error) }
            
            do {
                let talentBoss = try await vm.loadTalentBoss(reference: reference)
                talentMaterials[talentBoss] = 1
            } catch { print(error) }
        }
    }
}

struct DetailsProfileLayout<Content>: View where Content: View {
    private var backgroundImageURL: String
    private var profileImageURL: String
    private var content: () -> Content
    
    init(backgroundImageURL: String, profileImageURL: String, content: @escaping () -> Content) {
        self.backgroundImageURL = backgroundImageURL
        self.profileImageURL = profileImageURL
        self.content = content
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            CustomAsyncImage(imageURL: backgroundImageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.4)
                    .padding(-70)
            } failedImage: {
                EmptyView()
            }
            VStack(alignment: .center, spacing: 0) {
                CustomAsyncImage(imageURL: profileImageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: CGFloat.getBounds().lower * 0.4)
                } failedImage: {
                    Image("UnkownNation")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: CGFloat.getBounds().lower * 0.4)
                }
                content()
                    .padding(.horizontal)
            }
        }
    }
}

struct CharacterDetailsContent: View {
    
    private var character: CharacterModel
    
    init(character: CharacterModel) {
        self.character = character
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            CustomTitleView(self.character.name )
            Text("\(self.character.title ?? "?") - \(formatBirthday())")
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .medium, design: .rounded))
            StarRarity(amount: self.character.rarity)
            .padding(.bottom)
            Text(self.character.description)
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .medium, design: .rounded))
            CustomSeparator()
                .padding(.vertical, 10)
            HStack {
                ImageWithTitleView(title: (self.character.weaponType.lowercased().capitalized), image: WeaponTypeImage(rawValue: (self.character.weaponType.lowercased() ))?.getImage() ?? Image("IconSword"))
                AsyncImageWithTitle(title: (self.character.nation ), imageURL: "https://api.genshin.dev/nations/\(self.character.nation.lowercased() )/icon", failedImage: {
                    Image("UnkownNation")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                })
            }
        }
        .overlay(alignment: .topTrailing) {
            CustomAsyncImage(imageURL: "https://api.genshin.dev/elements/\(character.vision.lowercased())/icon") { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: CGFloat.getBounds().lower * 0.13)
            } failedImage: {
                Image("UnkownNation")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: CGFloat.getBounds().lower * 0.13)
            }
        }
    }
    
    private func formatBirthday() -> String {
        if let fullDate = character.birthday, fullDate.contains("-") {
            let aux = fullDate.split(separator: "-")
            return "\(aux[aux.count - 2])/\(aux[aux.count - 1])"
        }
        return "?"
    }
}

struct CharacterNavigationLink<Destination>: View where Destination: View {
    
    private var title: String
    private var imageURL: String
    private var destination: () -> Destination
    
    init(title: String, imageURL: String, destination: @escaping () -> Destination) {
        self.title = title
        self.imageURL = imageURL
        self.destination = destination
    }
    
    var body: some View {
        NavigationLink {
            destination()
        } label: {
            ContentBalloon {
                HStack {
                    Text(title)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                    Spacer()
                    CustomAsyncImage(imageURL: imageURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: CGFloat.getBounds().higher * 0.05)
                    } failedImage: {
                        Image("UnkownNation")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: CGFloat.getBounds().higher * 0.05)
                    }
                }
            }
        }
        
    }
}
