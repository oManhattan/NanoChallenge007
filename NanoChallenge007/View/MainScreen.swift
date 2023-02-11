//
//  MainScreen.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 01/02/23.
//

import SwiftUI

struct MainScreen: View {
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center, spacing: 10) {
                    NavigationArrange1()
                        .frame(height: CGFloat.getBounds().higher * 0.3)
                    NavigationArrange2()
                        .frame(height: CGFloat.getBounds().higher * 0.14)
                    NavigationArrange3()
                        .frame(height: CGFloat.getBounds().higher * 0.3)
                    NavigationArrange4()
                        .frame(height: CGFloat.getBounds().higher * 0.14)
                    NavigationArrange5()
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
                CustomNavigationLink2(title: "Boss Material", imageURL: "https://api.genshin.dev/materials/boss-material/hurricane-seed", rarity: 5) {
                    BossMaterialList()
                } imageAdjustment: { image in
                    return image
                        .resizable()
                        .scaledToFit()
                }
                CustomNavigationLink2(title: "Local Specialities", imageURL: "https://api.genshin.dev/materials/local-specialties/cecilia", rarity: 5) {
                    LocalSpecialtiesList()
                } imageAdjustment: { image in
                    return image
                        .resizable()
                        .scaledToFit()
                }
            }
        }
    }
}

private struct NavigationArrange2: View {
    var body: some View {
        HStack(spacing: 20) {
            CustomNavigationLink2(title: "Talent Book", imageURL: "https://api.genshin.dev/materials/talent-book/philosophies-of-freedom", rarity: 5) {
                EmptyView()
            } imageAdjustment: { image in
                image
                    .resizable()
                    .scaledToFit()
            }
            
            CustomNavigationLink2(title: "Talent Boss", imageURL: "https://api.genshin.dev/materials/talent-boss/tusk-of-monoceros-caeli", rarity: 5) {
                EmptyView()
            } imageAdjustment: { image in
                image
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

private struct NavigationArrange3: View {
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            VStack(spacing: 20) {
                CustomNavigationLink2(title: "Artifacts", imageURL: "https://api.genshin.dev/artifacts/gladiator-s-finale/flower-of-life", rarity: 5) {
                    EmptyView()
                } imageAdjustment: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                CustomNavigationLink2(title: "Weapon Ascetion", imageURL: "https://api.genshin.dev/materials/weapon-ascension/dream-of-the-dandelion-gladiator", rarity: 5) {
                    EmptyView()
                } imageAdjustment: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            
            CustomNavigationLink1(title: "Weapons", imageURL: "https://api.genshin.dev/weapons/skyward-atlas/icon") {
                EmptyView()
            } imageAdjustment: { image in
                ZStack {
                    Image("Background5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(40)
                }
            }
        }
    }
}

private struct NavigationArrange4: View {
    var body: some View {
        HStack(spacing: 20) {
            CustomNavigationLink2(title: "Enemies", imageURL: "https://api.genshin.dev/enemies/hilichurl/portrait", rarity: 1) {
                EmptyView()
            } imageAdjustment: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            CustomNavigationLink2(title: "Common Ascention", imageURL: "https://api.genshin.dev/materials/common-ascension/slime-concentrate", rarity: 1) {
                EmptyView()
            } imageAdjustment: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

private struct NavigationArrange5: View {
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
            
            CustomNavigationLink2(title: "Consumable", imageURL: "https://api.genshin.dev/consumables/food/sweet-madame", rarity: 1) {
                EmptyView()
            } imageAdjustment: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}
