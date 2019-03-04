//
//  Gallery.swift
//  PhotosBrowser
//
//  Created by Wei-Lun Su on 1/26/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

struct Gallery: Decodable {
    var stat: String?
    var title: String?
    var photos: Photos?
}
