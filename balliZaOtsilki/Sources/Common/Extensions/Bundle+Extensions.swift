//
//  Bundle+Extensions.swift
//  SuperDealNew
//
//  Created by Konstantin on 2/22/18.
//  Copyright © 2018 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation

extension Bundle {
    
    class func getIdentifier() -> String {
        guard let info = Bundle.main.infoDictionary,
            let bundleIdentifier = info["CFBundleIdentifier"] as? String else {
                return ""
        }
        
        return bundleIdentifier
    }
    
    class func getVersion() -> String {
        guard let info = Bundle.main.infoDictionary,
            let currentVersion = info["CFBundleShortVersionString"] as? String else {
                return ""
        }
        
        return currentVersion
    }
    
}
