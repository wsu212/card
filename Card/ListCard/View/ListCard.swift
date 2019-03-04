//
//  ListCard.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

protocol ListCardDelegate: AnyObject {
    func userDidTapRow(_ row: CardData)
}

class ListCard<T: CardData>: Card {
    
    // MARK: - UI Properties
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 15.0
        stackView.layoutMargins = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 15.0, right: 0.0)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - non-UI Properties
    
    private var viewModel:  ListCardViewModel<T>
    public weak var delegate: ListCardDelegate?
    
    public init(viewModel: ListCardViewModel<T>) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupSubviews()
        setupConstraints()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public API
    
    public static func build(withRows rows: [T]) -> ListCard<T> {
        let components = rows.map { ListCardRowViewModel(data: $0) }
        let viewModel = ListCardViewModel(components: components)
        return ListCard(viewModel: viewModel)
    }
    
    
    // MARK: - Private helper methods
    
    private func setupSubviews() {
        
        cardView.addSubview(stackView)
        
        viewModel.components.forEach {
            let row = ListCardRow(viewModel: $0, delegate: self)
            stackView.addArrangedSubview(row)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor)])
    }
}


extension ListCard: ListCardRowDelegate {
    func userDidTapRow(_ row: CardData) {
        delegate?.userDidTapRow(row)
    }
}
