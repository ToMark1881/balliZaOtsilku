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
    
    static let labelColor: UIColor = {
        return UIColor(named: "Label Color")!
    }()
    
    static let secondaryLabelColor: UIColor = {
        return UIColor(named: "Secondary Label Color")!
    }()
    
    static let buttonColor: UIColor = {
        return UIColor(named: "Button Color")!
    }()
    
    static let secondaryButtonColor: UIColor = {
        return UIColor(named: "Secondary Button Color")!
    }()
    
    static let backgroundColor: UIColor = {
        return UIColor(named: "Background Color")!
    }()
    
    static let secondaryBackgroundColor: UIColor = {
        return UIColor(named: "Secondary Background Color")!
    }()
    
}

struct ApplicationFonts {
    
    static func mediumWithSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Nunito-Regular", size: size)!
    }
    
    static func boldWithSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Nunito-Bold", size: size)!
    }
    
    static func lightWithSize(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Nunito-Light", size: size)!
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
