//
//  Galleries.swift
//  PhotosBrowser
//
//  Created by Allen Su on 1/26/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

struct Galleries: Decodable {
    var total: Int?
    var per_page: Int?
    var user_id: String?
    var page: String?
    var pages: Int?
    var gallery: [GalleryInfo]?
}
