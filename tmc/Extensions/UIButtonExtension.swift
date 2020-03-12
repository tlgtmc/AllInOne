//
//  UIButtonExtension.swift
//  tmc
//
//  Created by Tolga Atmaca on 12.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//


import UIKit

extension UIButton {
    
    func roundButton(_ cornerRadius: CGFloat, _ borderColor: UIColor, _ borderWidth: CGFloat) {
        let tintedImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.setImage(tintedImage, for: .normal)
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
}
