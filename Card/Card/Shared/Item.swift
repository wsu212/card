//
//  Item.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

public protocol Item {
    var itemTitle: String? { get }
    var itemDescription: String? { get }
    var itemImageURL: String? { get }
}
