//
//  ListCardViewModel.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

struct ListCardViewModel<T: Item> {
    
    var title: String
    var components: [ListCardRowViewModel<T>]
    
    init(title: String, components: [ListCardRowViewModel<T>]) {
        self.title = title
        self.components = components
    }
}
