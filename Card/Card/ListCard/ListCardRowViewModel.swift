//
//  ListCardRowViewModel.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

public struct ListCardRowViewModel<T: CardData> {
    
    public var row: T
    public var image: String { return row.cardImageURL ?? "" }
    public var title: String { return row.cardTitle }
    
    public init(row: T) {
        self.row = row
    }
}
