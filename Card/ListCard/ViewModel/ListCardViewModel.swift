//
//  ListCardViewModel.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

struct ListCardViewModel<T: CardData> {
    var components: [ListCardRowViewModel<T>]
    
    public init(components: [ListCardRowViewModel<T>]) {
        self.components = components
    }
}
