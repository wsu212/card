//
//  ImageCell.swift
//  Card
//
//  Created by Wei-Lun Su on 3/4/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

class ImageCell<T: Item>: UICollectionViewCell {
    
    private let card = ImageCard<T>()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(card)
        card.pinEdges(to: contentView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateUI(item: T) {
        card.updateUI(item: item)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        card.updateUI(item: nil)
    }
}
