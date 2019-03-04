//
//  Card.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

open class Card: UIView {
    
    lazy var cardView: UIView = {
        let cardView = UIView()
        cardView.layer.cornerRadius = 5.0
        cardView.backgroundColor = .white
        cardView.clipsToBounds = true
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cardView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cardView.leftAnchor.constraint(equalTo: leftAnchor),
            cardView.rightAnchor.constraint(equalTo: rightAnchor)])
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
