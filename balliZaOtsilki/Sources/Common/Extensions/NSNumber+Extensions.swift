//
//  NSNumber+Extensions.swift
//  SuperDealProd
//
//  Created by sergey on 5/2/18.
//  Copyright © 2018 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation

extension NSNumber {
    
    public func round() -> NSNumber {
        let fraction: Double = self.doubleValue - Double(self.intValue)
        
        if fraction < 0.5 {
            return NSNumber(value: self.intValue)
        } else {
         return NSNumber(value: self.intValue + 1)
        }
    }
    
}
