//
//  CarouselCard.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

protocol CarouselCardDelegate: AnyObject {
    func didSelectItem(_ item: CarouselData)
}

class CarouselCard<Cell: CarouselCell>: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - UI Properties

    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 15
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 4, right: 15)
        flowLayout.itemSize = CGSize(width: 210, height: 300)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.scrollsToTop = false
        collectionView.allowsMultipleSelection = false
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - non-UI Properties
    
    private var items: [CarouselData] {
        didSet { collectionView.reloadData() }
    }

    var reuseIdentifiers: Set<String> = []

    weak var delegate: CarouselCardDelegate?
    
    init(items: [CarouselData] = []) {
        self.items = items
        super.init(frame: .zero)
        setupSubviews()
        setupConstraints()
    }

    func updateUI(items: [CarouselData]) {
        self.items = items
    }

    func selectItem(_ item: CarouselData) {
        delegate?.didSelectItem(item)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        [collectionView].forEach { addSubview($0) }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width),
            collectionView.heightAnchor.constraint(equalToConstant: 304.0),
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 22.0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor)])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let reuseIdentifier = "\(Cell.self)"

        if reuseIdentifiers.contains(reuseIdentifier) == false {
            collectionView.register(Cell.self, forCellWithReuseIdentifier: reuseIdentifier)
            reuseIdentifiers.insert(reuseIdentifier)
        }

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? Cell else { return UICollectionViewCell() }
        guard indexPath.row < items.count else { return UICollectionViewCell() }

        cell.configure(item: items[indexPath.row])

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        selectItem(item)
    }
}
