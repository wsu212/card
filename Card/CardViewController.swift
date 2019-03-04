//
//  CardViewController.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    enum Mac: CardData {
        case macBook
        case macBookPro
        case macBookAir
        case iMac
        
        var title: String {
            switch self {
            case .macBook: return "MacBook"
            case .macBookPro: return "MacBook Pro"
            case .macBookAir: return "MacBook Air"
            case .iMac: return "iMac"
            }
        }
        
        var description: String {
            switch self {
            case .macBook: return "Thinner takes all."
            case .macBookPro: return "More power. More performance. More pro."
            case .macBookAir: return "Lightness strikes again."
            case .iMac: return "The vision is brighter than ever."
            }
        }
        
        var image: String? { return nil }
        
        static let allCases: [Mac] = [.macBook, .macBookPro, .macBookAir, .iMac]
    }
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        let listCard = ListCard<Mac>.build(withRows: Mac.allCases)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor)])
        
        stackView.addArrangedSubview(listCard)
    }
}

