//
//  Tappable.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

protocol Tappable: AnyObject {
    func addTapGestureRecognizer(target: Any, action: Selector)
}

extension Tappable where Self: UIView {
    func addTapGestureRecognizer(target: Any, action: Selector) {
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(target, action: action)
        addGestureRecognizer(tapRecognizer)
    }
}
