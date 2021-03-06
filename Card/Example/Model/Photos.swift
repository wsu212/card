//
//  Photos.swift
//  Card
//
//  Created by Wei-Lun Su on 3/9/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

struct Photos: Decodable {
    var page: Int?
    var pages: Int?
    var perpage: Int?
    var total: Int?
    var photo: [Photo]?
}

struct Photo: Decodable, Identifiable {
    var id: String?
    var owner: String?
    var secret: String?
    var server: String?
    var farm: Int?
    var title: String?
    var ispublic: Int?
    var isfriend: Int?
    var isfamily: Int?
}

extension Photo {
    var imageURL: String? {
        guard let farm = farm, let server = server, let id = id, let secret = secret else { return nil }
        return "https://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg"
    }
    
    var isDisplayable: Bool {
        guard let title = title, let owner = owner else { return false }
        return !title.isEmpty && !owner.isEmpty
    }
}
