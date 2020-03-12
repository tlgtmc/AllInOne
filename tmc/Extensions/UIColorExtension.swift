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
    static let pastel7 = UIColor(rgb: 0xB29DD9)
    
    
    static let tmc1 = UIColor(rgb: 0x35495e)
    static let tmc2 = UIColor(rgb: 0x347474)
    static let tmc3 = UIColor(rgb: 0xee8572)
    static let tmc4 = UIColor(rgb: 0xf1f3f4)
}
