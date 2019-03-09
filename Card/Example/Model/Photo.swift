//
//  Photo.swift
//  PhotosBrowser
//
//  Created by Wei-Lun Su on 1/26/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

struct Photo: Decodable {
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
