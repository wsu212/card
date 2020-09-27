//
//  GalleriesViewModel.swift
//  Card
//
//  Created by Wei-Lun Su on 3/4/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

class GalleriesViewModel {
    
    private let service = FlickrService()
    var didUpdateGalleries: (() -> Void)?
    var didFailedUpdateGalleries: (() -> Void)?
    
    var galleries: [Gallery] {
        didSet { self.didUpdateGalleries?() }
    }
    
    init(galleries: [Gallery] = []) {
        self.galleries = galleries
    }
    
    func getGalleryIds(page: Int = 0, itemsPerPage: Int = 10) {
        service.getGalleryIds(page: page, itemsPerPage: itemsPerPage) { infos in
            if let infos = infos {
                infos.forEach { self.getGallery(by: $0) }
            } else {
                self.didFailedUpdateGalleries?()
            }
        }
    }
    
    func getGallery(by info: GalleryInfo) {
        service.getGallery(by: info) { gallery in
            if let gallery = gallery {
                self.galleries.append(gallery)
            } else {
                self.didFailedUpdateGalleries?()
            }
        }
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
