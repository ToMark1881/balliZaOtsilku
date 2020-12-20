//
//  UIScrollView+Extensions.swift
//  SuperDealNew
//
//  Created by Pokupon & SuperDeal Mobile Team on 5/23/17.
//  Copyright © 2017 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView {
    
    // Scroll to a specific view so that it's top is at the top our scrollview
    func scrollToView(view: UIView, animated: Bool) {
        if let origin = view.superview {
            // Get the Y position of your child view
            let childStartPoint = origin.convert(view.frame.origin, to: self)
            // Scroll to a rectangle starting at the Y of your subview, with a height of the scrollview
            self.scrollRectToVisible(CGRect(x: 0, y: childStartPoint.y, width: 1, height: self.frame.height), animated: animated)
        }
    }
    
}
