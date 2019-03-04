//
//  UIViewExtension.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit
import AlamofireImage

extension UILabel {
    func applyAppearance(_ appearance: LabelAppearance) {
        self.numberOfLines = appearance.numberOfLines
        self.font = appearance.font
        self.textColor = appearance.textColor
    }
}

enum LabelAppearance {
    case navigationBar
    case header
    case title
    case subtitle
    
    var font: UIFont {
        switch self {
        case .navigationBar: return UIFont.boldSystemFont(ofSize: 20.0)
        case .header: return UIFont.boldSystemFont(ofSize: 16.0)
        case .title: return UIFont.boldSystemFont(ofSize: 14.0)
        case .subtitle: return UIFont.italicSystemFont(ofSize: 11.0)
        }
    }
    
    var textColor: UIColor {
        return .black
    }
    
    var numberOfLines: Int {
        return 1
    }
}

extension UIImageView {
    func setImage(url: String?) {
        guard let url = url, let imageUrl = URL(string: url) else { return }
        af_setImage(withURL: imageUrl,
                    imageTransition: .crossDissolve(0.4),
                    runImageTransitionIfCached: false)
    }
}
