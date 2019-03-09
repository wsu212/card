//
//  CardsListViewController.swift
//  Card
//
//  Created by Wei-Lun Su on 3/8/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

class CardTemplatesViewController: UITableViewController {
    
    enum CardTemplate: String {
        case carouselCard
        case listCard
        
        var name: String {
            switch self {
            case .carouselCard: return "Carousel Card"
            case .listCard: return "List Card"
            }
        }
        
        static let allCases: [CardTemplate] = [.carouselCard,
                                               .listCard]
    }
    
    private let cellIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return CardTemplate.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = CardTemplate.allCases[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = type.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = CardTemplate.allCases[indexPath.section]
        
        switch type {
        case .listCard:
            return
        case .carouselCard:
            let viewModel = GalleriesViewModel()
            let viewController = CarouselViewController(viewModel: viewModel)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

