//
//  ArtifactDetails.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 13/02/23.
//

import SwiftUI

struct ArtifactDetails: View {
    
    private var reference: String
    private var artifact: ArtifactModel
    @State private var artifactPieces: [String] = []
    
    init(reference: String, artifact: ArtifactModel) {
        self.reference = reference
        self.artifact = artifact
    }

    var body: some View {
        VStack(spacing: 0) {
            DetailsProfileLayout(backgroundImageURL: "https://api.genshin.dev/artifacts/\(reference)/flower-of-life", profileImageURL: "https://api.genshin.dev/artifacts/\(reference)/flower-of-life") {
                ContentBalloon {
                    VStack(spacing: 10) {
                        CustomTitleView(artifact.name)
                        ContentText("Artifact")
                        StarRarity(amount: artifact.rarity)
                        CustomSeparator()
                        if let onePiece = artifact.onePieceBonus {
                            TitleDetail("1 Piece", alignment: .leading)
                            ContentText(onePiece, alignment: .leading)
                        }
                        if let twoPiece = artifact.twoPieceBonus {
                            TitleDetail("2 Piece", alignment: .leading)
                            ContentText(twoPiece, alignment: .leading)
                        }
                        if let fourPiece = artifact.fourPieceBonus {
                            TitleDetail("4 Piece", alignment: .leading)
                            ContentText(fourPiece, alignment: .leading)
                        }
                        CustomSeparator()
                        GridList(self.artifactPieces, numberOfColumns: 3, horizontalSpacing: 20) { element in
                            ImageRoundedBackground(imageURL: element, rarity: self.artifact.rarity)
                                .frame(height: CGFloat.getBounds().higher * 0.1)
                        }
                    }
                }
            }
            Spacer()
        }
        .navigationTitle("Artifact Details")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            do {
                let request = try HTTPRequest.builder().path("https://api.genshin.dev/artifacts/\(self.reference)/images").timeoutInterval(20).build()
                let (data, _) = try await request.send()
                if
                    let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any],
                    let availableImages = json["availableImages"] as? [String] {
                    for image in availableImages {
                        self.artifactPieces.append("https://api.genshin.dev/artifacts/\(self.reference)/\(image)")
                    }
                }
            } catch { print(error) }
        }
    }
}

struct ArtifactDetails_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
