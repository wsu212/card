//
//  List.swift
//  Card
//
//  Created by Su, Wei-Lun on 9/28/20.
//  Copyright © 2020 Wei-Lun Su. All rights reserved.
//

import Foundation

protocol List: Decodable {
    var numberOfItems: Int { get }
    func item(at indexPath: IndexPath) -> Item?
}
