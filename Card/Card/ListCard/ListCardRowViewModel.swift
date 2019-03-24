//
//  ListCardRowViewModel.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

struct ListCardRowViewModel<T: CardData> {
    
    var row: T
    var image: String { return row.cardImageURL ?? "" }
    var title: String { return row.cardTitle ?? "" }
    
    init(row: T) {
        self.row = row
    }
}
