//
//  CharacterTalentView.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 10/02/23.
//

import SwiftUI

struct CharacterTalentView: View {
    private var reference: String
    private var character: CharacterModel
    
    init(reference: String, character: CharacterModel) {
        self.reference = reference
        self.character = character
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                CustomAsyncImage(imageURL: "https://api.genshin.dev/characters/\(reference)/gacha-splash") { image in
                    image.resizable().aspectRatio(contentMode: .fit)
                } failedImage: {
                    Image("UnkownNation").resizable().aspectRatio(contentMode: .fit)
                }
                VStack(spacing: 10) {
                    if let normalAttak = character.skillTalents.filter({$0.type == "NORMAL_ATTACK"}).first {
                        CharacterNormalAttackView(reference: reference, skillTalent: normalAttak)
                    }
                    if let elementalSkill = character.skillTalents.filter({$0.type == "ELEMENTAL_SKILL"}).first {
                        CharacterElementalSkillView(reference: reference, skillTalent: elementalSkill, imageReference: "talent-skill", alignment: .trailing)
                    }
                    if let elementalBurst = character.skillTalents.filter({$0.type == "ELEMENTAL_BURST"}).first {
                        CharacterElementalSkillView(reference: reference, skillTalent: elementalBurst, imageReference: "talent-burst", alignment: .leading)
                    }
                    
                    ForEach(Array(character.passiveTalents.sorted(by: {$0.level ?? 0 < $1.level ?? 0}).enumerated()), id: \.element) { index, passive in
                        CharacterPassiveTalentView(reference: reference, passiveTalent: passive, imageReference: "talent-passive-\(index)", alignment: index % 2 == 0 ? .trailing : .leading)
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Skills and passives")
    }
}

private struct CharacterNormalAttackView: View {
    
    private var descritpion: [String:String]
    private var reference: String
    private var skillTalent: SkillTalentModel
    
    
    init(reference: String, skillTalent: SkillTalentModel) {
        self.reference = reference
        self.skillTalent = skillTalent
        self.descritpion = [:]
        var aux = skillTalent.description.split(separator: "Plunging Attack")
        if let content = aux.getElementAt(1) {
            descritpion["3-Plunging Attack"] = String(content).replacingOccurrences(of: "\n", with: "")
        }
        aux = aux[0].split(separator: "Charged Attack")
        descritpion["2-Charged Attack"] = String(aux[1]).replacingOccurrences(of: "\n", with: "")
        aux = aux[0].split(separator: "Normal Attack")
        descritpion["1-Normal Attack"] = String(aux[0]).replacingOccurrences(of: "\n", with: "")
    }
    
    var body: some View {
        ContentBalloon {
            VStack(alignment: .leading) {
                DetailHeader(imageURL: "https://api.genshin.dev/characters/\(reference)/talent-na", title: skillTalent.unlock.capitalized, subtitle: skillTalent.name, alignment: .leading)
                CustomSeparator()
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(descritpion.sorted(by: {$0.key < $1.key}), id: \.key) { descritpion in
                        let title = descritpion.key.split(separator: "-", maxSplits: 1)[1]
                        TitleDetail("\(title)", alignment: .leading)
                            .font(.system(size: 18, weight: .medium, design: .rounded))
                        ContentText(descritpion.value, alignment: .leading)
                            .font(.system(size: 12, weight: .medium))
                    }
                }
            }
        }
    }
}

private struct CharacterElementalSkillView: View {
    
    private var imageReference: String
    private var reference: String
    private var skillTalent: SkillTalentModel
    private var alignment: DetailHeader.DetailHeaderAlignment
    
    init(reference: String, skillTalent: SkillTalentModel, imageReference: String, alignment: DetailHeader.DetailHeaderAlignment = .leading) {
        self.imageReference = imageReference
        self.reference = reference
        self.skillTalent = skillTalent
        self.alignment = alignment
    }
    
    var body: some View {
        ContentBalloon {
            VStack(alignment: .trailing) {
                DetailHeader(imageURL: "https://api.genshin.dev/characters/\(reference)/\(imageReference)", title: skillTalent.unlock.capitalized, subtitle: skillTalent.name, alignment: alignment)
                CustomSeparator()
                VStack(alignment: .leading) {
                    ContentText(skillTalent.description, alignment: .leading)
                }
            }
        }
    }
}

private struct CharacterPassiveTalentView: View {
    
    private var reference: String
    private var passiveTalent: PassiveTalentModel
    private var imageReference: String
    private var alignment: DetailHeader.DetailHeaderAlignment
    
    init(reference: String, passiveTalent: PassiveTalentModel, imageReference: String, alignment: DetailHeader.DetailHeaderAlignment) {
        self.reference = reference
        self.passiveTalent = passiveTalent
        self.imageReference = imageReference
        self.alignment = alignment
    }
    
    var body: some View {
        ContentBalloon {
            VStack {
                DetailHeader(imageURL: "https://api.genshin.dev/characters/\(reference)/\(imageReference)", title: passiveTalent.name, subtitle: "Passive - \(passiveTalent.unlock)", alignment: alignment)
                CustomSeparator()
                ContentText(passiveTalent.description, alignment: .leading)
            }
        }
    }
}

struct DetailHeader: View {
    enum DetailHeaderAlignment {
        case leading, trailing
    }
    
    private var imageURL: String
    private var title: String
    private var subtitle: String
    private var alignment: DetailHeaderAlignment
    
    init(imageURL: String, title: String, subtitle: String, alignment: DetailHeaderAlignment) {
        self.imageURL = imageURL
        self.title = title
        self.subtitle = subtitle
        self.alignment = alignment
    }
    
    var body: some View {
        switch alignment {
        case .leading:
            HStackLayout {
                CustomAsyncImage(imageURL: imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } failedImage: {
                    Image("UnkownNation")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(height: CGFloat.getBounds().higher * 0.085)
                VStack(alignment: .leading) {
                    TitleDetail(title, alignment: .leading)
                    ContentText(subtitle, alignment: .leading)
                }
            }
        case .trailing:
            HStackLayout {
                VStack(alignment: .trailing) {
                    TitleDetail(title, alignment: .trailing)
                    ContentText(subtitle, alignment: .trailing)
                }
                CustomAsyncImage(imageURL: imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } failedImage: {
                    Image("UnkownNation")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(height: CGFloat.getBounds().higher * 0.085)
            }
        }
    }
}

struct TitleDetail: View {
    private var title: String
    private var alignment: Alignment
    
    init(_ title: String, alignment: Alignment = .center) {
        self.title = title
        self.alignment = alignment
    }
    
    var body: some View {
        Text(title)
            .foregroundColor(Color("TitleDetials"))
            .font(.system(size: 22, weight: .semibold, design: .rounded))
            .frame(maxWidth: .infinity, alignment: alignment)
            .minimumScaleFactor(0.2)
    }
}

struct ContentText: View {
    private var title: String
    private var alignment: Alignment
    
    init(_ title: String, alignment: Alignment = .center) {
        self.title = title
        self.alignment = alignment
    }
    
    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: alignment)
            .minimumScaleFactor(0.2)
    }
}

struct CharacterTalentView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
