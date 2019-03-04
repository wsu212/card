//
//  CardAppearance.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit
import Foundation

struct CardAppearance {
    
    let titleFont: UIFont
    let titleTextColor: UIColor
    let subtitleFont: UIFont
    let subtitleTextColor: UIColor
    let backgroundColor: UIColor
    
    init(titleFont: UIFont,
         titleTextColor: UIColor,
         subtitleFont: UIFont,
         subtitleTextColor: UIColor,
         backgroundColor: UIColor) {
        self.titleFont = titleFont
        self.titleTextColor = titleTextColor
        self.subtitleFont = subtitleFont
        self.subtitleTextColor = subtitleTextColor
        self.backgroundColor = backgroundColor
    }
}
