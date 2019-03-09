//
//  ListCardRow.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

protocol ListCardRowDelegate: AnyObject {
    func userDidTapRow(_ row: CardData)
}

class ListCardRow<T: CardData>: UIView, Tappable {
    
    // MARK: - UI Properties
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: CardDescriptionLabel = {
        let label = CardDescriptionLabel(numberOfLines: 1, textColor: LabelAppearance.subtitle.textColor)
        return label
    }()
    
    // MARK: - non-UI Properties
    
    var viewModel: ListCardRowViewModel<T>
    weak var delegate: ListCardRowDelegate?
    
    init(viewModel: ListCardRowViewModel<T>, delegate: ListCardRowDelegate?) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(frame: .zero)
        setupSubviews()
        setupConstraints()
        addTapGestureRecognizer(target: self, action: #selector(tap))
        setupAccessibilityLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        titleLabel.text = viewModel.title
        [imageView, titleLabel].forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 40.0),
            imageView.heightAnchor.constraint(equalToConstant: 40.0),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20.0),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 3.0),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3.0),
            titleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 20.0),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20.0),
            titleLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)])
    }
    
    @objc func tap() {
        delegate?.userDidTapRow(viewModel.row)
    }
    
    private func setupAccessibilityLabel() {
        isAccessibilityElement = true
        accessibilityTraits = .button
        accessibilityLabel = viewModel.title
    }
}
