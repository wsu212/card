//
//  CarouselViewController.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

class CarouselViewController: UIViewController {
    
    private var viewModel: GalleriesViewModel
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.registerCell(type: GalleryTableViewCell.self)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100.0
        return tableView
    }()
    
    // MARK: - Initializer
    
    init(viewModel: GalleriesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getGalleryIds()
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
        tableView.pinEdges(to: view)
    }
}

extension CarouselViewController: GalleriesViewModelDelegate {
    
    func didUpdateGalleries() {
        tableView.reloadData()
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

extension CarouselViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfGalleries()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(type: GalleryTableViewCell.self, indexPath: indexPath)
        let gallery = viewModel.gallery(at: indexPath)
        cell.configure(with: gallery)
        return cell
    }
}
