//
//  CardData.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

protocol CardData {
    var title: String { get }
    var description: String { get }
    var image: String? { get }
}
