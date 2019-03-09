//
//  ImageCard.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit
import AlamofireImage

protocol ImageCardDelegate: AnyObject {
    func userDidTapImageCard(data: CardData)
}

class ImageCard<T: CardData>: Card, Tappable {
    
    // MARK: - UI Properties
    
    let imageView = CardImageView()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = LabelAppearance.title.font
        label.textColor = LabelAppearance.title.textColor
        return label
    }()
    
    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = LabelAppearance.subtitle.font
        label.textColor = LabelAppearance.subtitle.textColor
        return label
    }()
    
    // MARK: - non-UI Properties
    
    private var data: T?
    weak var delegate: ImageCardDelegate?
    
    init(data: T? = nil) {
        self.data = data
        super.init(frame: .zero)
        setupSubviews()
        createConstraints()
        addTapGestureRecognizer(target: self, action: #selector(tap))
        
        if let data = data {
            updateUI(data: data)
        }
        
        applyShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI(data: CardData) {
        titleLabel.text = data.cardTitle
        subtitleLabel.text = data.cardDescription
        imageView.setImage(url: data.cardImageURL)
    }
    
    private func setupSubviews() {
        [imageView,
         titleLabel,
         subtitleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            cardView.addSubview($0)
        }
    }
    
    private func createConstraints() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 194.0),
            imageView.topAnchor.constraint(equalTo: cardView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: cardView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: cardView.rightAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20.0),
            titleLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20.0),
            titleLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -20.0),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6.0),
            subtitleLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20.0),
            subtitleLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20.0),
            subtitleLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -20.0)])
    }
    
    @objc func tap() {
        if let data = data {
            delegate?.userDidTapImageCard(data: data)
        }
    }
}
