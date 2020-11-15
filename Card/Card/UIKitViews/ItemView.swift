//
//  ItemView.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

open class ItemView: UIView {
    
    lazy var mainView: UIView = {
        let cardView = UIView()
        cardView.layer.cornerRadius = 5.0
        cardView.backgroundColor = .white
        cardView.clipsToBounds = true
        return cardView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainView)
        mainView.pinEdges(to: self)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
