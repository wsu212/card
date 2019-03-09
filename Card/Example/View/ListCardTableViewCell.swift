//
//  ListCardTableViewCell.swift
//  Card
//
//  Created by Wei-Lun Su on 3/8/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

class ListCardTableViewCell: UITableViewCell {
    
    enum Mac: CardData {
        case macBook
        case macBookPro
        case macBookAir
        case iMac
        
        var cardTitle: String {
            switch self {
            case .macBook: return "MacBook"
            case .macBookPro: return "MacBook Pro"
            case .macBookAir: return "MacBook Air"
            case .iMac: return "iMac"
            }
        }
        
        var cardDescription: String {
            switch self {
            case .macBook: return "Thinner takes all."
            case .macBookPro: return "More power. More performance. More pro."
            case .macBookAir: return "Lightness strikes again."
            case .iMac: return "The vision is brighter than ever."
            }
        }
        
        var cardImageURL: String? { return nil }
    }
    
    private let listCard = ListCard<Mac>.build(withTitle: "Mac", rows: [.macBook, .macBookPro, .macBookAir, .iMac])
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(listCard)
        listCard.pinEdges(to: contentView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
