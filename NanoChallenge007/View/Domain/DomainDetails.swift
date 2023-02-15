//
//  DomainDetails.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 15/02/23.
//

import SwiftUI

struct DomainDetails: View {
    
    @ObservedObject private var domainvm: DomainViewModel
    private var domain: DomainModel
    private var images: [String]
    
    init(domain: DomainModel, images: [String], domainViewModel: DomainViewModel) {
        self.domain = domain
        self.images = images
        self.domainvm = domainViewModel
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                GridList(images, numberOfColumns: images.count) { element in
                    ZStack(alignment: .bottomTrailing) {
                        CustomAsyncImage(imageURL: element) { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                                .frame(width: CGFloat.getBounds().lower * 0.22)
                                .padding(-70)
                                .opacity(0.4)
                        } failedImage: {
                            Image("UnkownNation").resizable().aspectRatio(contentMode: .fit)
                        }
                        CustomAsyncImage(imageURL: element) { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                                .frame(width: CGFloat.getBounds().lower * 0.22)
                        } failedImage: {
                            Image("UnkownNation").resizable().aspectRatio(contentMode: .fit)
                        }
                    }
                }
                DomainBasicDetails(domain: domain)
                DomainRecommendedElements(elements: domain.recommendedElements)
                DomainRequirements(requirements: domain.requirements)
                DomainRewardsDetials(domainViewModel: domainvm, domain: domain)
            }
            .padding(.horizontal)
        }
        .navigationTitle("Domain Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DomainBasicDetails: View {
    
    private var domain: DomainModel
    
    init(domain: DomainModel) {
        self.domain = domain
    }
    
    var body: some View {
        ContentBalloon {
            VStack(spacing: 10) {
                CustomTitleView(domain.name)
                ContentText("Domain")
                ContentText(domain.description, alignment: .leading)
                CustomSeparator()
                AsyncImageWithTitle(title: domain.nation, imageURL: "https://api.genshin.dev/nations/\(domain.nation.formatToURL())/icon") {
                    Image("UnkownNation").resizable().aspectRatio(contentMode: .fit)
                }
            }
        }
    }
}

struct DomainRecommendedElements: View {
    
    private var elements: [String]
    
    init(elements: [String]) {
        self.elements = elements
    }
    
    var body: some View {
        ContentBalloon {
            VStack(spacing: 10) {
                CustomTitleView("Recommended Elements")
                GridList(elements, numberOfColumns: 4, horizontalSpacing: 15) { element in
                    CustomAsyncImage(imageURL: "https://api.genshin.dev/elements/\(element.formatToURL())/icon") { image in
                        image.resizable().aspectRatio(contentMode: .fit)
                    } failedImage: {
                        Image("UnkownNation").resizable().aspectRatio(contentMode: .fit)
                    }.frame(height: CGFloat.getBounds().higher * 0.08)
                }
            }
        }
    }
}

struct DomainRequirements: View {
    private var requirements: [DomainRequirementsModel]
    
    init(requirements: [DomainRequirementsModel]) {
        self.requirements = requirements
    }
    
    var body: some View {
        ContentBalloon {
            VStack(spacing: 10) {
                if let requirement = requirements.sorted(by: {$0.level > $1.level}).first {
                    CustomTitleView("Ley Line Disorder")
                        .padding(.bottom, -50)
                    ContentText(requirement.leyLineDisorder.reduce("", {"\($0)\n\($1)"}), alignment: .leading)
                }
            }
        }
    }
}

struct DomainRewardsDetials: View {
    @ObservedObject private var domainvm: DomainViewModel
    private var domain: DomainModel
    private var category: String {
        return (domain.name.formatToURL() == "cecilia-garden" || domain.name.formatToURL() == "hidden-palace-of-lianshan-formula") ? "materials/weapon-ascension" : "artifacts"
    }
    
    init(domainViewModel: DomainViewModel, domain: DomainModel) {
        self.domainvm = domainViewModel
        self.domain = domain
    }
    
    var body: some View {
        ForEach(domain.rewards, id: \.self) { reward in
            if let detail = reward.details.sorted(by: {$0.level > $1.level}).first, let items = detail.items {
                ContentBalloon {
                    VStack(spacing: 10) {
                        CustomTitleView(reward.day.capitalized)
                        ContentText("Drops")
                        CustomSeparator()
                        GridList(items, numberOfColumns: 4) { element in
                            CustomAsyncImage(imageURL: "https://api.genshin.dev/\(category)/\(element.name.formatToURL())/\((element.name == "artifacts") ? "flower-of-life" : "")") { image in
                                image.resizable().aspectRatio(contentMode: .fit)
                            } failedImage: {
                                Image("UnkownNation").resizable().aspectRatio(contentMode: .fit)
                            }

                        }
                    }
                }
            }
        }
    }
}
