//
//  PhotosService.swift
//  PhotosBrowser
//
//  Created by Wei-Lun Su on 1/26/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import Foundation
import Alamofire

class PhotosService {
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
    
    func getGalleryIds(page: Int, itemsPerPage: Int, completion:@escaping ([GalleryInfo]?) -> ()) {
        let parameters = "&page=\(page)&per_page=\(itemsPerPage)"
        let url = PhotosService.baseURL + "?method=\(Content.galleries.method)\(PhotosService.format)\(parameters)&api_key=\(PhotosService.apiKey)&user_id=\(PhotosService.flickrId)"
        
        Alamofire.request(url).responseData { response in
            if let data = response.data, let collection = try? PhotosService.decoder.decode(Collection.self, from: data), let infos = collection.galleries?.gallery {
                completion(infos)
            } else {
                completion(nil)
            }
        }
    }
    
    func getGallery(by info: GalleryInfo, completion:@escaping (Gallery?) -> ()) {
        
        guard let id = info.gallery_id else {
            completion(nil)
            return
        }
        
        let url = PhotosService.baseURL + "?method=\(Content.photos.method)\(PhotosService.format)&api_key=\(PhotosService.apiKey)&gallery_id=\(id)"
        
        Alamofire.request(url).responseData { response in
            if let data = response.data, let gallery = try? PhotosService.decoder.decode(Gallery.self, from: data) {
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
