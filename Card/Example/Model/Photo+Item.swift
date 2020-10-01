//
//  Photo+Item.swift
//  Card
//
//  Created by Wei-Lun Su on 3/9/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

extension Photo: Item {
    var headline: String? { return title }
    var summary: String? { return owner }
    var image: String? { return imageURL }
}
