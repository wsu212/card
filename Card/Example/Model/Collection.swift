//
//  Collection.swift
//  Card
//
//  Created by Wei-Lun Su on 3/9/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

struct Collection: Decodable {
    var stat: String?
    var galleries: Galleries?
}

struct Galleries: Decodable {
    var total: Int?
    var per_page: Int?
    var user_id: String?
    var page: String?
    var pages: Int?
    var gallery: [GalleryInfo]?
}

struct GalleryInfo: Decodable {
    var gallery_id: String?
    var title: GalleryTitle?
}

struct GalleryTitle: Decodable {
    var _content: String?
}

struct Gallery: Decodable {
    var stat: String?
    var title: String?
    var photos: Photos?
}

extension Gallery: ItemList {
    var numberOfItems: Int {
        photos?.photo?.count ?? 0
    }

    func item(at indexPath: IndexPath) -> Item? {
        photos?.photo?[indexPath.row]
    }
}
