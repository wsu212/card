//
//  Photo+CardData.swift
//  Card
//
//  Created by Wei-Lun Su on 3/9/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

extension Photo: CardData {
    var cardTitle: String {
        return title ?? ""
    }
    
    var cardDescription: String {
        return owner ?? ""
    }
    
    var cardImageURL: String? {
        return imageURL
    }
}
