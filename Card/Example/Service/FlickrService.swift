//
//  FlickrService.swift
//  PhotosBrowser
//
//  Created by Wei-Lun Su on 1/26/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation
import Combine
import Alamofire

class FlickrService {
    private static let apiKey = "857ada15e03464531ad7ce95a61c545b"
    private static let flickrId = "66956608@N06"
    private static let baseURL = "https://api.flickr.com/services/rest/"
    private static let format = "&format=json&nojsoncallback=1"
    private static let decoder = JSONDecoder()
    
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

extension FlickrService {
    
    func getAllGalleryIds(page: Int, itemsPerPage: Int) -> AnyPublisher<[GalleryInfo], Error> {
        let parameters = "&page=\(page)&per_page=\(itemsPerPage)"
        let urlString = Self.baseURL + "?method=\(Content.galleries.method)\(Self.format)\(parameters)&api_key=\(Self.apiKey)&user_id=\(Self.flickrId)"
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL.")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Collection.self, decoder: Self.decoder)
            .compactMap(\.galleries?.gallery)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func getGallery(by info: GalleryInfo, completion:@escaping (Gallery?) -> ()) {
        guard let id = info.gallery_id else {
            completion(nil)
            return
        }
        let url = Self.baseURL + "?method=\(Content.photos.method)\(Self.format)&api_key=\(Self.apiKey)&gallery_id=\(id)"
        Alamofire.request(url).responseData { response in
            if let data = response.data, let gallery = try? Self.decoder.decode(Gallery.self, from: data) {
                var galleryCopy = gallery
                galleryCopy.title = info.title?._content
                galleryCopy.photos?.photo = gallery.photos?.photo?.filter { $0.isDisplayable }
                completion(galleryCopy)
            } else {
                completion(nil)
            }
        }
    }
}
