//
//  PhotoRow.swift
//  Card
//
//  Created by Wei-Lun Su on 9/30/20.
//  Copyright © 2020 Wei-Lun Su. All rights reserved.
//

import SwiftUI

struct PhotoRow: View {
    var photo: Photo    
    var body: some View {
        HStack {
            AsyncImageView(url: photo.imageURL ?? "")
            VStack(alignment: .leading) {
                Spacer()
                Text(photo.title ?? "N/A")
                    .font(.headline)
                Spacer()
                Text(photo.owner ?? "N/A")
                    .font(.caption)
                Spacer()
            }
        }
    }
}

struct PhotoRow_Previews: PreviewProvider {
    static var previews: some View {
        PhotoRow(photo: Photo())
    }
}
