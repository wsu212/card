//
//  GalleriesViewController.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

class GalleriesViewController: UICollectionViewController {
    
    private var viewModel: GalleriesViewModel
    
    // MARK: - Initializer
    
    init(viewModel: GalleriesViewModel) {
        self.viewModel = viewModel
        let layout = Self.layout
        super.init(collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Compositional Layout
    
    private static let layout = UICollectionViewCompositionalLayout { _, _ in
        carouselLayoutSection
    }

    private static let carouselLayoutSection: NSCollectionLayoutSection = {
      let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .absolute(300.0)
      )
      let item = NSCollectionLayoutItem(layoutSize: itemSize)

      let groupSize = NSCollectionLayoutSize(
        widthDimension: .absolute(200.0),
        heightDimension: .estimated(300.0)
      )
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
      let section = NSCollectionLayoutSection(group: group)
      section.orthogonalScrollingBehavior = .continuous
      section.interGroupSpacing = 10
      section.contentInsets = .init(top: 10, leading: 10, bottom: 0, trailing: 10)
      return section
    }()
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.didUpdateGalleries = { [weak self] in
            self?.collectionView.reloadData()
        }
        setupSubviews()
        viewModel.getGalleries()
    }
    
    private func setupSubviews() {
        view.backgroundColor = .systemBackground
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.register(cell: ImageCell.self)
    }
}

extension GalleriesViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(in: section)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageCell = collectionView.dequeue(for: indexPath)
        let photo = viewModel.photo(at: indexPath)
        if let photo = photo {
            cell.configure(item: photo)
        }
        return cell
    }
}
