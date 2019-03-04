//
//  CardData.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

public protocol CardData {
    var cardTitle: String { get }
    var cardDescription: String { get }
    var cardImageURL: String? { get }
}
