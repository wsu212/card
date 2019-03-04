//
//  GalleryInfo.swift
//  PhotosBrowser
//
//  Created by Allen Su on 1/26/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

struct GalleryInfo: Decodable {
    var gallery_id: String?
    var title: GalleryTitle?
}

struct GalleryTitle: Decodable {
    var _content: String?
}
