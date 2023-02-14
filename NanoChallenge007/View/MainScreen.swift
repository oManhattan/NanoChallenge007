//
//  MainScreen.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 01/02/23.
//

import SwiftUI

struct MainScreen: View {
    
    @StateObject private var listvm = ListViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center, spacing: 10) {
                    NavigationArrange1(listViewModel: listvm)
                        .frame(height: CGFloat.getBounds().higher * 0.3)
                    NavigationArrange2(listViewModel: listvm)
                        .frame(height: CGFloat.getBounds().higher * 0.14)
                    NavigationArrange3(listViewModel: listvm)
                        .frame(height: CGFloat.getBounds().higher * 0.3)
                    NavigationArrange4(listViewModel: listvm)
                        .frame(height: CGFloat.getBounds().higher * 0.14)
                    NavigationArrange5(listViewModel: listvm)
                        .frame(height: CGFloat.getBounds().higher * 0.14)
                }
                .frame(width: CGFloat.getBounds().lower - 20)
                .padding(.horizontal)
            }
            .navigationTitle("Tevyat Guide")
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

private struct NavigationArrange1: View {
    
    @ObservedObject private var listvm: ListViewModel
    
    init(listViewModel: ListViewModel) {
        self.listvm = listViewModel
    }
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 20) {
            CustomNavigationLink2(title: "Characters", imageURL: "https://api.genshin.dev/characters/traveler-anemo/icon-big-lumine", rarity: 5) {
                CharactersListVIew()
            } imageAdjustment: { image in
                image
                    .resizable()
                    .scaledToFit()
            }
            
            VStack(spacing: 20) {
                NavigationLinkCard(title: "Boss Material", imageURL: "https://api.genshin.dev/materials/boss-material/hurricane-seed", rarity: 5, imageAlignment: .bottom) {
                    ItemList(title: "Boss Materials", items: listvm.bossMaterials.sorted(by: {$0.value < $1.value})) { item in
                        NavigationLinkCard(title: item.key.name, imageURL: "https://api.genshin.dev/materials/boss-material/\(item.value)", rarity: 4, imageAlignment: .bottom, height: CGFloat.getBounds().higher * 0.18) {
                            BossMaterialDetails(reference: item.value, bossMaterial: item.key)
                        } imageAdjustment: { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        }
                    }
                    .onAppear {
                        Task {
                            do { try await listvm.loadBossMaterials() } catch { print(error) }
                        }
                    }
                } imageAdjustment: { image in
                    image.resizable().aspectRatio(contentMode: .fit)
                }
                
                NavigationLinkCard(title: "Local Specialtie", imageURL: "https://api.genshin.dev/materials/local-specialties/cecilia", rarity: 5, imageAlignment: .bottom) {
                    ItemList(title: "Local Specialties", items: listvm.localSpecialties.sorted(by: {$0.value < $1.value})) { item in
                        NavigationLinkCard(title: item.key.name, imageURL: "https://api.genshin.dev/materials/local-specialties/\(item.key.id)", rarity: 1, imageAlignment: .bottom, height: CGFloat.getBounds().higher * 0.18) {
                            LocalSpecialtiesDetails(reference: item.value, specialtie: item.key)
                        } imageAdjustment: { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        }
                    }
                    .onAppear {
                        Task {
                            do { try await listvm.loadLocalSpecialties() } catch { print(error) }
                        }
                    }
                } imageAdjustment: { image in
                    image.resizable().aspectRatio(contentMode: .fit)
                }
            }
        }
    }
}

private struct NavigationArrange2: View {
    
    @ObservedObject private var listvm: ListViewModel
    
    init(listViewModel: ListViewModel) {
        self.listvm = listViewModel
    }
    
    var body: some View {
        HStack(spacing: 20) {
            NavigationLinkCard(title: "Talent Book", imageURL: "https://api.genshin.dev/materials/talent-book/philosophies-of-freedom", rarity: 5, imageAlignment: .bottom, height: nil) {
                ItemList(title: "Talent Books", items: listvm.talentBooks.sorted(by: {$0.value < $1.value})) { item in
                    if let book = item.key.items.sorted(by: {$0.rarity > $1.rarity}).first {
                        NavigationLinkCard(title: item.value.capitalized, imageURL: "https://api.genshin.dev/materials/talent-book/\(book.id)", rarity: book.rarity, imageAlignment: .bottom, height: CGFloat.getBounds().higher * 0.18) {
                            TalentBookDetails(reference: item.value, book: item.key, bookCover: book)
                        } imageAdjustment: { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        }
                    }
                }
                .onAppear {
                    Task {
                        do { try await listvm.loadTalentBooks() } catch { print(error) }
                    }
                }
            } imageAdjustment: { image in
                image.resizable().aspectRatio(contentMode: .fit)
            }
            
            NavigationLinkCard(title: "Talent Boss", imageURL: "https://api.genshin.dev/materials/talent-boss/tusk-of-monoceros-caeli", rarity: 5, imageAlignment: .bottom, height: nil) {
                ItemList(title: "Talent Bosses", items: listvm.talentBosses.sorted(by: {$0.value < $1.value})) { item in
                    NavigationLinkCard(title: item.key.name, imageURL: "https://api.genshin.dev/materials/talent-boss/\(item.key.id)", rarity: 5, imageAlignment: .bottom, height: CGFloat.getBounds().higher * 0.18) {
                        TalentBossDetails(boss: item.key)
                    } imageAdjustment: { image in
                        image.resizable().aspectRatio(contentMode: .fit)
                    }
                    
                }
                .task {
                    Task{
                        do { try await listvm.loadTalentBosses() } catch { print(error) }
                    }
                }
            } imageAdjustment: { image in
                image.resizable().aspectRatio(contentMode: .fit)
            }
        }
    }
}

private struct NavigationArrange3: View {
    
    @ObservedObject private var listvm: ListViewModel
    
    init(listViewModel: ListViewModel) {
        self.listvm = listViewModel
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            VStack(spacing: 20) {
                NavigationLinkCard(title: "Artifact", imageURL: "https://api.genshin.dev/artifacts/gladiator-s-finale/flower-of-life", rarity: 5, imageAlignment: .bottom, height: nil) {
                    ItemList(title: "Artifacts", items: listvm.artifacts.sorted(by: {$0.value < $1.value})) { item in
                        NavigationLinkCard(title: item.key.name, imageURL: "https://api.genshin.dev/artifacts/\(item.value)/flower-of-life", rarity: item.key.rarity, imageAlignment: .bottom, height: CGFloat.getBounds().higher * 0.18) {
                            ArtifactDetails(reference: item.value, artifact: item.key)
                        } imageAdjustment: { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        }
                    }
                    .onAppear {
                        Task {
                            do { try await listvm.loadArtifacts() } catch { print(error) }
                        }
                    }
                } imageAdjustment: { image in
                    image.resizable().aspectRatio(contentMode: .fit)
                }
                
                NavigationLinkCard(title: "Weapon Ascension", imageURL: "https://api.genshin.dev/materials/weapon-ascension/dream-of-the-dandelion-gladiator", rarity: 5, imageAlignment: .bottom, height: nil) {
                    ItemList(title: "Weapon Ascensions", items: listvm.weaponAscensions.sorted(by: {$0.value < $1.value})) { item in
                        if let weapon = item.key.items.sorted(by: {$0.rarity > $1.rarity}).first {
                            NavigationLinkCard(title: item.value.capitalized.replacingOccurrences(of: "-", with: " "), imageURL: "https://api.genshin.dev/materials/weapon-ascension/\(weapon.id.replacingOccurrences(of: "'", with: "-"))", rarity: weapon.rarity, imageAlignment: .bottom, height: CGFloat.getBounds().higher * 0.18) {
                                WeaponAscensionDetails(reference: item.value, weaponAscension: item.key, weaponAscensionImage: "https://api.genshin.dev/materials/weapon-ascension/\(weapon.id.replacingOccurrences(of: "'", with: "-"))")
                            } imageAdjustment: { image in
                                image.resizable().aspectRatio(contentMode: .fit)
                            }
                        }
                    }
                    .onAppear {
                        Task {
                            do { try await listvm.loadWeaponAscensions() } catch { print(error) }
                        }
                    }
                } imageAdjustment: { image in
                    image.resizable().aspectRatio(contentMode: .fit)
                }
            }
            
            NavigationLinkCard(title: "Weapon", imageURL: "https://api.genshin.dev/weapons/skyward-atlas/icon", rarity: 5, imageAlignment: .bottom, height: nil) {
                ItemList(title: "Weapons", items: listvm.weapons.sorted(by: {$0.value < $1.value})) { item in
                    NavigationLinkCard(title: item.key.name ?? "?", imageURL: "https://api.genshin.dev/weapons/\(item.value)/icon", rarity: item.key.rarity, imageAlignment: .bottom, height: CGFloat.getBounds().higher * 0.18) {
                        WeaponDetails(reference: item.value, weapon: item.key)
                    } imageAdjustment: { image in
                        image.resizable().aspectRatio(contentMode: .fit)
                    }
                }
                .onAppear {
                    Task {
                        do { try await listvm.loadWeapons() } catch { print(error) }
                    }
                }
            } imageAdjustment: { image in
                image.resizable().aspectRatio(contentMode: .fit)
            }
        }
    }
}

private struct NavigationArrange4: View {
    
    @ObservedObject private var listvm: ListViewModel
    
    init(listViewModel: ListViewModel) {
        self.listvm = listViewModel
    }
    
    var body: some View {
        HStack(spacing: 20) {
            NavigationLinkCard(title: "Enemy", imageURL: "https://api.genshin.dev/enemies/hilichurl/portrait", rarity: 1, imageAlignment: .bottom, height: nil) {
                ItemList(title: "Enemies", items: listvm.enemies.sorted(by: {$0.value < $1.value})) { item in
                    NavigationLinkCard(title: item.key.name, imageURL: "https://api.genshin.dev/enemies/\(item.value)/icon", rarity: 1, imageAlignment: .bottom, height: CGFloat.getBounds().higher * 0.18) {
                        EnemyDetails(reference: item.value, enemy: item.key)
                    } imageAdjustment: { image in
                        image.resizable().aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .padding()
                    }
                }
                .onAppear {
                    Task {
                        do { try await listvm.loadEnemies() } catch { print(error) }
                    }
                }
            } imageAdjustment: { image in
                image.resizable().aspectRatio(contentMode: .fit)
            }
            
            NavigationLinkCard(title: "Common Ascension", imageURL: "https://api.genshin.dev/materials/common-ascension/slime-concentrate", rarity: 1, imageAlignment: .bottom, height: nil) {
                ItemList(title: "Common Ascensions", items: listvm.commonAscensions.sorted(by: {$0.value < $1.value})) { item in
                    if let material = item.key.items.filter({$0.rarity == 3}).first {
                        let formattedImageURL = "https://api.genshin.dev/materials/common-ascension/\(material.id.replacingOccurrences(of: "'", with: "-"))"
                        NavigationLinkCard(title: item.value.capitalized.replacingOccurrences(of: "-", with: " "), imageURL: formattedImageURL, rarity: material.rarity, imageAlignment: .bottom, height: CGFloat.getBounds().higher * 0.18) {
                            CommonAscensionDetails(reference: item.value, commonAscension: item.key, imageURL: formattedImageURL)
                        } imageAdjustment: { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        }
                    }
                }
                .onAppear {
                    Task {
                        do { try await listvm.loadCommonAscension() } catch { print(error) }
                    }
                }
            } imageAdjustment: { image in
                image.resizable().aspectRatio(contentMode: .fit)
            }
        }
    }
}

private struct NavigationArrange5: View {
    
    @ObservedObject private var listvm: ListViewModel
    
    init(listViewModel: ListViewModel) {
        self.listvm = listViewModel
    }
    
    var body: some View {
        
        HStack(spacing: 20) {
            NavigationLink {
                EmptyView()
            } label: {
                ImageCard(title: "Domains", rarity: 1, alignment: .bottom) {
                    Image("IconDomain")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            
            NavigationLinkCard(title: "Consumable", imageURL: "https://api.genshin.dev/consumables/food/sweet-madame", rarity: 1, imageAlignment: .bottom, height: nil) {
                ItemList(title: "Consumables", items: listvm.consumables.sorted(by: {$0.value < $1.value})) { item in
                    NavigationLinkCard(title: item.key.name, imageURL: "https://api.genshin.dev/consumables/food/\(item.value)", rarity: item.key.rarity, height: CGFloat.getBounds().higher * 0.18) {
                        ConsumableDetails(reference: item.value, consumable: item.key)
                    } imageAdjustment: { image in
                        image.resizable().resizable()
                    }
                }
                .task {
                    do { try await listvm.loadConsumables() } catch { print(error) }
                }
            } imageAdjustment: { image in
                image.resizable().aspectRatio(contentMode: .fit)
            }
        }
    }
}
