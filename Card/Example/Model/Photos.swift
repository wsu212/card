//
//  Photos.swift
//  PhotosBrowser
//
//  Created by Allen Su on 1/26/19.
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
