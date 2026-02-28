//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Archit  Joshi on 27/02/26.
//
import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(from urlString: String) {
        NetworkManager.shared.downloadImage(from: urlString) { uiImage in
            guard let uiImage else { return }
            DispatchQueue.main.async { [self] in
                image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    var placeHolder: String
    var body: some View {
        image?.resizable() ?? Image(placeHolder).resizable()
    }
}

struct AppetizerRemoteImage: View {
    @StateObject private var imageLoader = ImageLoader()
    var urlString: String
    var placeHolder: String = ""
    
    var body: some View {
        RemoteImage(image: imageLoader.image,
                    placeHolder: placeHolder)
            .onAppear { imageLoader.load(from: urlString) }
    }
}
