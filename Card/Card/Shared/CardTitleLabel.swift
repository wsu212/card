//
//  CardTitleLabel.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

class CardTitleLabel: UILabel {
    
    init(numberOfLines: Int) {
        super.init(frame: .zero)
        self.font = LabelAppearance.title.font
        self.textColor = LabelAppearance.title.textColor
        self.numberOfLines = numberOfLines
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
