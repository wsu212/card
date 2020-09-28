//
//  Service.swift
//  Card
//
//  Created by Su, Wei-Lun on 9/28/20.
//  Copyright © 2020 Wei-Lun Su. All rights reserved.
//

import Foundation
import Combine

protocol Service {
    func get<T: Decodable>(page: Int, itemsPerPage: Int) -> AnyPublisher<[T], Error>
}
