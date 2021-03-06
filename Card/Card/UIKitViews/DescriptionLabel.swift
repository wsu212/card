//
//  DescriptionLabel.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

class DescriptionLabel: UILabel {
    
    init(numberOfLines: Int, textColor: UIColor) {
        super.init(frame: .zero)
        self.font = LabelAppearance.subtitle.font
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
