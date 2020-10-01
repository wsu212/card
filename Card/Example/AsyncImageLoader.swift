//
//  AsyncImageLoader.swift
//  Card
//
//  Created by Wei-Lun Su on 9/30/20.
//  Copyright © 2020 Wei-Lun Su. All rights reserved.
//

import Foundation
import Combine

class AsyncImageLoader: ObservableObject {
    private var data = Data() {
        didSet { didChange.send(data) }
    }
    
    var didChange = PassthroughSubject<Data, Never>()

    init(url: String) {
        guard let url = URL(string: url) else {
            fatalError("Invalid URL")
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                fatalError("Invalid data")
            }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}
