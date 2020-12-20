//
//  NSMutableAttributedString+Extensions.swift
//  SuperDealNew
//
//  Created by Konstantin on 3/28/18.
//  Copyright © 2018 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
    
    public func setAsLink(textToFind:String, linkURL:String) -> Bool {
        
        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(NSAttributedString.Key.link, value: linkURL, range: foundRange)
            return true
        }
        return false
    }
}
