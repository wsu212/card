//
//  ListViewModel.swift
//  Card
//
//  Created by Wei-Lun Su on 3/4/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation
import Combine

class ListViewModel<T: ItemList> {
    private let service: Service
    private var cancellable: AnyCancellable?
    
    var didUpdateItems: (() -> Void)?
    
    var items: [T] {
        didSet { self.didUpdateItems?() }
    }
    
    init(items: [T], service: Service) {
        self.items = items
        self.service = service
    }
    
    func getItems(page: Int = 0, itemsPerPage: Int = 20) {
        self.cancellable = service.get(page: page, itemsPerPage: itemsPerPage)
            .sink(receiveCompletion: { _ in }) { galleries in
            self.items = galleries
        }
    }
    
    func numberOfSections() -> Int {
        return items.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        let list = items[section]
        return list.numberOfItems
    }
    
    func item(at indexPath: IndexPath) -> Item? {
        let list = items[indexPath.section]
        return list.item(at: indexPath)
    }
}
