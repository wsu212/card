//
//  ImageCard.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

protocol ImageCardDelegate: AnyObject {
    func userDidTapImageCard(item: Item)
}

class ImageCard<T: Item>: ItemView, Tappable {
    
    // MARK: - UI Properties
    
    let imageView = ItemImageView()
    
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
    
    private var item: T?
    weak var delegate: ImageCardDelegate?
    
    init(item: T? = nil) {
        self.item = item
        super.init(frame: .zero)
        setupSubviews()
        createConstraints()
        addTapGestureRecognizer(target: self, action: #selector(tap))
        
        if let item = item {
            updateUI(item: item)
        }
        
        applyShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI(item: Item?) {
        titleLabel.text = item?.itemTitle
        subtitleLabel.text = item?.itemDescription
        imageView.setImage(url: item?.itemImageURL)
    }
    
    private func setupSubviews() {
        [imageView,
         titleLabel,
         subtitleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            mainView.addSubview($0)
        }
    }
    
    private func createConstraints() {
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 194.0),
            imageView.topAnchor.constraint(equalTo: mainView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: mainView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: mainView.rightAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20.0),
            titleLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20.0),
            titleLabel.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20.0),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6.0),
            subtitleLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20.0),
            subtitleLabel.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 20.0),
            subtitleLabel.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -20.0)])
    }
    
    @objc func tap() {
        if let item = item {
            delegate?.userDidTapImageCard(item: item)
        }
    }
}
