//
//  GalleryTableViewCell.swift
//  Card
//
//  Created by Wei-Lun Su on 3/4/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

class GalleryTableViewCell: UITableViewCell {

    static let reuseIdentifier = "\(GalleryTableViewCell.self)"
    
    private let carouselCard = CarouselCard<PhotoCell>(title: "Hello World")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(carouselCard)
        
        carouselCard.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            carouselCard.topAnchor.constraint(equalTo: contentView.topAnchor),
            carouselCard.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            carouselCard.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            carouselCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with gallery: Gallery) {
        guard let title = gallery.title, let photos = gallery.photos?.photo else { return }
        carouselCard.updateUI(title: title, items: photos)
    }
}
