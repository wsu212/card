//
//  UITableViewExtensions.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit
import Foundation

extension UITableView {
    
    @discardableResult
    func registerCell<Cell: UITableViewCell>(type: Cell.Type, identifier: String? = nil) -> Self {
        let identifier = identifier ?? String(describing: type)
        register(type, forCellReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    func dequeueCell<Cell: UITableViewCell>(type: Cell.Type, identifier: String? = nil, indexPath: IndexPath) -> Cell {
        let identifier = identifier ?? String(describing: type)
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Cell else { fatalError() }
        return cell
    }
}
