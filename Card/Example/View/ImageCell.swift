//
//  ImageCell.swift
//  Card
//
//  Created by Wei-Lun Su on 3/4/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

class ImageCell: CarouselCell {
    
    private let card = ImageCard<Photo>()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(card)
        card.pinEdges(to: contentView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func configure(item: CardData) {
        card.updateUI(data: item)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        card.updateUI(data: nil)
    }
}
