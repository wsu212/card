//
//  UIViewExtension.swift
//  Card
//
//  Created by Wei-Lun Su on 3/3/19.
//  Copyright © 2019 Wei-Lun Su. All rights reserved.
//

import UIKit

extension UILabel {
    func applyAppearance(_ appearance: LabelAppearance) {
        self.numberOfLines = appearance.numberOfLines
        self.font = appearance.font
        self.textColor = appearance.textColor
    }
}

extension UIImageView {
    func setImage(url: String?) {
        guard let url = url,
              let imageUrl = URL(string: url) else { return }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
    }
}

extension UIView {
    func applyShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 2
    }
}

extension UIView {
    @discardableResult
    func pinEdges(to view: UIView, padding: CGFloat = 0.0) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            self.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            self.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -padding),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding)])
        return self
    }
    
    @discardableResult
    func setHeight(to height: CGFloat) -> UIView {
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
}
