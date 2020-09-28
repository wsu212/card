//
//  Photo+Item.swift
//  Card
//
//  Created by Wei-Lun Su on 3/9/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

extension Photo: Item {
    var itemTitle: String? { return title }
    var itemDescription: String? { return owner }
    var itemImageURL: String? { return imageURL }
}
