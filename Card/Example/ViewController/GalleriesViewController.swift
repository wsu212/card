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
        self.viewModel.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        setupSubviews()
        viewModel.getGalleryIds()
    }
    
    private func setupSubviews() {
        view.backgroundColor = .systemBackground
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell")
    }
}

extension GalleriesViewController: GalleriesViewModelDelegate {
    
    func didUpdateGalleries() {
        collectionView.reloadData()
    }
    
    func didFailedUpdateGalleries() {
        let alertController = UIAlertController(title: "Whoops, looks like we hit a network issue.",
                                                message: nil,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let retryAction = UIAlertAction(title: "Retry", style: .default) { _ in self.viewModel.getGalleryIds() }
        
        [defaultAction, retryAction].forEach { alertController.addAction($0) }
        
        present(alertController, animated: true, completion: nil)
    }
}

extension GalleriesViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfGalleries()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        let gallery = viewModel.gallery(at: indexPath)
        if let photo = gallery.photos?.photo?[indexPath.row] {
            cell.configure(item: photo)
        }
        return cell
    }
}
