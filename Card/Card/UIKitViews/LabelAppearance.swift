//
//  LabelAppearance.swift
//  Card
//
//  Created by Wei-Lun Su on 11/15/20.
//  Copyright © 2020 Wei-Lun Su. All rights reserved.
//

import UIKit

enum LabelAppearance {
    case headline
    case header
    case title
    case subtitle
    
    var font: UIFont {
        switch self {
        case .headline: return .boldSystemFont(ofSize: 18.0)
        case .header: return .boldSystemFont(ofSize: 16.0)
        case .title: return .boldSystemFont(ofSize: 14.0)
        case .subtitle: return .italicSystemFont(ofSize: 11.0)
        }
    }
    
    var textColor: UIColor {
        return .black
    }
    
    var numberOfLines: Int {
        return 1
    }
}
