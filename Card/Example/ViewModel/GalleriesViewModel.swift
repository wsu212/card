//
//  GalleriesViewModel.swift
//  Card
//
//  Created by Wei-Lun Su on 3/4/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation
import Combine

class GalleriesViewModel {
    
    private let service = FlickrService()
    
    private var cancellable: AnyCancellable?
    
    var didUpdateGalleries: (() -> Void)?
    var didFailedUpdateGalleries: (() -> Void)?
    
    var galleries: [Gallery] {
        didSet { self.didUpdateGalleries?() }
    }
    
    init(galleries: [Gallery] = []) {
        self.galleries = galleries
    }
    
    func getGalleries(page: Int = 0, itemsPerPage: Int = 20) {
        self.cancellable = service.getGalleries(page: page, itemsPerPage: itemsPerPage)
            .sink(receiveCompletion: { _ in }, receiveValue: { galleries in
            self.galleries = galleries
        })
    }
    
    func numberOfSections() -> Int {
        return galleries.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        let gallery = galleries[section]
        return gallery.photos?.photo?.count ?? 0
    }
    
    func photo(at indexPath: IndexPath) -> Photo? {
        let gallery = galleries[indexPath.section]
        let photo = gallery.photos?.photo?[indexPath.row]
        return photo
    }
}
