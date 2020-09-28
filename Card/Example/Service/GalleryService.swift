//
//  GalleryService.swift
//  Card
//
//  Created by Wei-Lun Su on 1/26/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation
import Combine

class GalleryService {
    private static let flickrId = "66956608@N06"
    private static let format = "&format=json&nojsoncallback=1"

    enum Content {
        case galleries
        case photos
        
        var method: String {
            switch self {
            case .galleries: return "flickr.galleries.getList"
            case .photos: return "flickr.galleries.getPhotos"
            }
        }
    }
}

extension GalleryService: Service {
    var baseURL: String { "https://api.flickr.com/services/rest/" }
    var apiKey: String { "857ada15e03464531ad7ce95a61c545b" }
    
    func get<T: Decodable>(page: Int, itemsPerPage: Int) -> AnyPublisher<[T], Error> {
        return getGalleryIds(page: page, itemsPerPage: itemsPerPage)
            .flatMap { ids in
                Publishers.Sequence(sequence: ids.map { self.getGallery(by: $0) })
                    .flatMap { $0 }
                    .collect()
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    private func getGalleryIds(page: Int, itemsPerPage: Int) -> AnyPublisher<[GalleryInfo], Error> {
        let parameters = "&page=\(page)&per_page=\(itemsPerPage)"
        let urlString = baseURL + "?method=\(Content.galleries.method)\(Self.format)\(parameters)&api_key=\(apiKey)&user_id=\(Self.flickrId)"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL.")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Collection.self, decoder: decoder)
            .compactMap(\.galleries?.gallery)
            .eraseToAnyPublisher()
    }
    
    private func getGallery<T: Decodable>(by info: GalleryInfo) -> AnyPublisher<T, Error> {
        guard let id = info.gallery_id else {
            fatalError("Invalid gallery id.")
        }
        let urlString = baseURL + "?method=\(Content.photos.method)\(Self.format)&api_key=\(apiKey)&gallery_id=\(id)"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL.")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
