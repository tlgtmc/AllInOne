//
//  UIViewExtension.swift
//  tmc
//
//  Created by Tolga Atmaca on 11.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//

import UIKit
import Toast_Swift

extension UIViewController {
    

    @IBInspectable var viewCornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            if viewShadow == false {
                self.layer.masksToBounds = true
            }
        }
    }
    
    func showProgress() {
        self.view.makeToastActivity(.center)
    }
    
    func hideActiveProgress() {
        self.view.hideToastActivity()
    }
    
    func showError(_ text: String) {
        self.view.makeToast(text, duration: 2.0, position: .center, title: nil, image: UIImage(named: "error.png"))
    }
}
