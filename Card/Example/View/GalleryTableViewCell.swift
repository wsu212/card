//
//  GalleryTableViewCell.swift
//  Card
//
//  Created by Wei-Lun Su on 3/4/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

class GalleryTableViewCell: UITableViewCell {
    
    private let carouselCard = CarouselCard<PhotoCell>()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(carouselCard)
        carouselCard.pinEdges(to: contentView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with gallery: Gallery) {
        guard let photos = gallery.photos?.photo else { return }
        carouselCard.updateUI(items: photos)
    }
}
