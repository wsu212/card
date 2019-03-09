//
//  PhotoCell.swift
//  Card
//
//  Created by Wei-Lun Su on 3/4/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

class PhotoCell: CarouselCell {
    
    private let card = ImageCard<Photo>()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(card)
        card.pinEdges(to: contentView)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override public func configure(item: CarouselData) {
        card.updateUI(data: item)
    }
}
