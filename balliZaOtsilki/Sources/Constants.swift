//
//  Constants.swift
//  SuperDeal
//
//  Created by Pokupon & SuperDeal Mobile Team on 3/19/15.
//  Copyright (c) 2015 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation
import UIKit

// MARK: -  GLOBAL CONSTS

let kAppStoreLink = ""
let kServerDateTimeFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

struct ScreenSize {
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType {
    static let IS_IPHONE_4_OR_LESS = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P_OR_BIGGER = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH >= 736.0
    static let IS_IPHONE_X = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
    static let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
}

struct ApplicationColors {
    
    static let darkColor: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.label.withAlphaComponent(0.95)
        }
        else {
            return UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1)
        }
    }()
    
    static let textColor: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.label
        }
        else {
            return UIColor.black
        }
    }()
    
    static let grayColor: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.systemGray
        }
        else {
            return UIColor(red: 0.538, green: 0.538, blue: 0.538, alpha: 1)
        }
    }()
    
    static let lightgrayColor: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.lightGray
        }
        else {
            return UIColor(red: 0.871, green: 0.871, blue: 0.871, alpha: 1)
        }
    }()
    
    static let snowColor: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.secondarySystemBackground
        }
        else {
            return UIColor(red: 0.979, green: 0.979, blue: 0.979, alpha: 1)
        }
    }()
    
    static let backgroundColor: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.tertiarySystemBackground
        }
        else {
            return UIColor(white: 1, alpha: 1)
        }
    }()
    
    static let secondaryBackgroundColor: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor.secondarySystemBackground
        }
        else {
            return UIColor(white: 1, alpha: 1)
        }
    }()
    
    static let yellowColor: UIColor = {
        return UIColor(red: 1, green: 0.945, blue: 0, alpha: 1)
    }()
    
    
    static let greenColor: UIColor = {
        return UIColor(red: 0.114, green: 0.633, blue: 0.103, alpha: 1)
    }()
    
}

struct ApplicationFonts {
    
    static func mediumWithSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Medium", size: size)!
    }
    
    static func boldWithSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Bold", size: size)!
    }
    
    static func lightWithSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Light", size: size)!
    }
    
}

func DARK_MODE_ACTIVATED_IN(viewController: UIViewController) -> Bool {
    if #available(iOS 13.0, *) {
        if viewController.traitCollection.userInterfaceStyle == .dark {
            return true
        }
    }
    return false
}

func DARK_MODE_ACTIVATED_IN(view: UIView) -> Bool {
    if #available(iOS 13.0, *) {
        if view.traitCollection.userInterfaceStyle == .dark {
            return true
        }
    }
    return false
}

func SYSTEM_VERSION_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric) == ComparisonResult.orderedSame
}

func SYSTEM_VERSION_GREATER_THAN(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric) == ComparisonResult.orderedDescending
}

func SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric) != ComparisonResult.orderedAscending
}

func SYSTEM_VERSION_LESS_THAN(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric) == ComparisonResult.orderedAscending
}

func SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version, options: .numeric) != ComparisonResult.orderedDescending
}
