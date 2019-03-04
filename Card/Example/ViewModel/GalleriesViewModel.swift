//
//  GalleriesViewModel.swift
//  Card
//
//  Created by Wei-Lun Su on 3/4/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation

protocol GalleriesViewModelDelegate: AnyObject {
    func didUpdateGalleries()
    func didFailedUpdateGalleries()
}

class GalleriesViewModel {
    
    private let service = PhotosService()
    weak var delegate: GalleriesViewModelDelegate?
    
    var galleries: [Gallery] {
        didSet { self.delegate?.didUpdateGalleries() }
    }
    
    init(galleries: [Gallery] = []) {
        self.galleries = galleries
    }
    
    func getGalleryIds(page: Int = 0, itemsPerPage: Int = 10) {
        service.getGalleryIds(page: page, itemsPerPage: itemsPerPage) { infos in
            if let infos = infos {
                infos.forEach { self.getGallery(by: $0) }
            } else {
                self.delegate?.didFailedUpdateGalleries()
            }
        }
    }
    
    func getGallery(by info: GalleryInfo) {
        service.getGallery(by: info) { gallery in
            if let gallery = gallery {
                self.galleries.append(gallery)
            } else {
                self.delegate?.didFailedUpdateGalleries()
            }
        }
    }
    
    func numberOfGalleries() -> Int {
        return galleries.count
    }
    
    func gallery(at indexPath: IndexPath) -> Gallery {
        return galleries[indexPath.row]
    }
}
