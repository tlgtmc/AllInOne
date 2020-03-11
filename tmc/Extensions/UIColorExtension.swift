//
//  UIColorExtension.swift
//  tmc
//
//  Created by Tolga Atmaca on 10.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//

import UIKit

extension UIColor {
    
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    static let pastel1 = UIColor(rgb: 0xE0FEFE)
    static let pastel2 = UIColor(rgb: 0xC7CEEA)
    static let pastel3 = UIColor(rgb: 0xFFDAC1)
    static let pastel4 = UIColor(rgb: 0xFF9AA2)
    static let pastel5 = UIColor(rgb: 0xFFFFD8)
    static let pastel6 = UIColor(rgb: 0xB5EAD7)
    static let pastel7 = UIColor(rgb: 0xB29DD9)
    static let pastel8 = UIColor(rgb: 0xFDFD98)
    static let pastel9 = UIColor(rgb: 0xFE6B64)
    static let pastel10 = UIColor(rgb: 0x77DD77)
    static let pastel11 = UIColor(rgb: 0x779ECB)
}