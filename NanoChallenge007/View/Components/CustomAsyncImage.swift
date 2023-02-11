//
//  CustomAsyncImage.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import SwiftUI

struct CustomAsyncImage<SuccessImage, FailedImage>: View where SuccessImage: View, FailedImage: View {
    
    @State private var loadedSuccesfully: Bool = false
    @State private var isLoading: Bool = true
    @State private var loadedImage: UIImage = UIImage()
    private var successImage: (_ image: Image) -> SuccessImage
    private var failedImage: () -> FailedImage
    private let imageURL: String
    
    init(imageURL: String, successImage: @escaping (_ image: Image) -> SuccessImage, failedImage: @escaping () -> FailedImage) {
        self.imageURL = imageURL
        self.successImage = successImage
        self.failedImage = failedImage
    }
    
    var body: some View {
        if isLoading == true && loadedSuccesfully == false {
            ProgressView()
                .task {
                    do {
                        let request = try HTTPRequest.builder()
                            .path(imageURL)
                            .method(.GET)
                            .timeoutInterval(5)
                            .build()
                        let (data, _) = try await request.send()
                        guard let image = UIImage(data: data) else {
                            throw URLError(.badServerResponse)
                        }
                        loadedImage = image
                        loadedSuccesfully = true
                        isLoading = false
                    } catch {
                        loadedSuccesfully = false
                        isLoading = false
                    }
                }
        } else if isLoading == false && loadedSuccesfully == true {
            successImage(Image(uiImage: loadedImage))
        } else if isLoading == false && loadedSuccesfully == false {
            failedImage()
        }
    }
}

struct CustomAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomAsyncImage(imageURL: "https://api.genshin.dev/characters/albedo/icon", successImage: { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }, failedImage: {
            Image("IconSword")
        })
    }
}
