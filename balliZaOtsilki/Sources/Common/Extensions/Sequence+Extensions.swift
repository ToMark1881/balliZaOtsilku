//
//  Set+Extensions.swift
//  SuperDealProd
//
//  Created by Pokupon & SuperDeal Mobile Team on 8/2/17.
//  Copyright © 2017 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation

extension Sequence where Iterator.Element: Hashable {
    
    func unique() -> [Iterator.Element] {
        var alreadyAdded = Set<Iterator.Element>()
        return self.filter { alreadyAdded.insert($0).inserted }
    }
}
