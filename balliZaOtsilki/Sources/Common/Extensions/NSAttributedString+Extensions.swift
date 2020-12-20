//
//  NSAttributedString+Extensions.swift
//  SuperDealNew
//
//  Created by Konstantin on 2/22/18.
//  Copyright © 2018 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation

extension NSAttributedString {
    func rangeOf(string: String) -> NSRange? {
        return (self.string as NSString).range(of: string)
    }
}
