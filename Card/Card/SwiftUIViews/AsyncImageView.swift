//
//  AsyncImageView.swift
//  Card
//
//  Created by Wei-Lun Su on 9/30/20.
//  Copyright © 2020 Wei-Lun Su. All rights reserved.
//

import SwiftUI

struct AsyncImageView: View {
    @ObservedObject var imageLoader: AsyncImageLoader
    @State var image: UIImage = UIImage()

    init(url: String) {
        imageLoader = AsyncImageLoader(url:url)
    }

    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(4)
            .frame(width: 88, height: 88)
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
            }
    }
}

struct LoadedImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(url: "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg")
    }
}
