//
//  UIColor+Extensions.swift
//  SuperDealNew
//
//  Created by Pokupon & SuperDeal Mobile Team on 2/20/17.
//  Copyright © 2017 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {

    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(
                red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat((hex & 0x0000FF) >> 0) / 255.0,
                alpha: alpha
        )
    }
    
    static let systemBackColor: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemBackground
        }
        else {
            return UIColor.white
        }
    }()
    
    static let whiteChangingColor: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.tertiarySystemBackground
        }
        else {
            return UIColor.white
        }
    }()
    
    static let secondaryWhiteChangingColor: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.secondarySystemBackground
        }
        else {
            return UIColor.white
        }
    }()
}
