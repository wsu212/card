//
//  ListCardRowViewModel.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

struct ListCardRowViewModel<T: CardData> {
    
    var data: T
    var image: String { return data.image ?? "" }
    var title: String { return data.title }
    
    public init(data: T) {
        self.data = data
    }
}
