//
//  URL+Extensions.swift
//  SuperDealProd
//
//  Created by iosdev on 25.02.2020.
//  Copyright © 2020 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation


extension URL {
    var typeIdentifier: String? {
        return (try? resourceValues(forKeys: [.typeIdentifierKey]))?.typeIdentifier
    }
    var localizedName: String? {
        return (try? resourceValues(forKeys: [.localizedNameKey]))?.localizedName
    }
}
