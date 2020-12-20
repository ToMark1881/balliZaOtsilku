//
//  ErrorFactory.swift
//  SuperDealNew
//
//  Created by Pokupon & SuperDeal Mobile Team on 12/30/16.
//  Copyright © 2016 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation


struct ErrorsFactory {

    struct General {
        static let connection: NSError = ErrorsFactory.error(with: "No internet connection".localized, code: 99999)
        static let unknown: NSError = ErrorsFactory.error(with: "Unknown error".localized, code: 99998)
        static let location: NSError = ErrorsFactory.error(with: "Location Services Off".localized, code: 99997)
        static let serverUrlIsMissing: NSError = ErrorsFactory.error(with: "Server URL is missing".localized, code: 99996)
        static let processIsBusy: NSError = ErrorsFactory.error(with: "The process is busy".localized, code: 99995)
    }
    
    struct Location {
        static let locationNotFounded: NSError = ErrorsFactory.error(with: "Can't find any location ☹️".localized)
    }
    
    struct LocalNotification {
        static let dealNotFounded: NSError = ErrorsFactory.error(with: "No deals found nearby".localized)
    }
    
    struct Purchase {
        static let paymentNotAvailable: NSError = ErrorsFactory.error(with: "Sorry, this payment method is not available.".localized)
        static let notEnoughMoney: NSError = ErrorsFactory.error(with: "You do not have enough funds to pay".localized)
        static let notEnoughBonuses: NSError = ErrorsFactory.error(with: "You do not have enough coins to pay".localized)
        static let paymentMethodNotSelected: NSError = ErrorsFactory.error(with: "Select a Payment Method".localized)
        static let paymentMethodIsNotAvailable: NSError = ErrorsFactory.error(with: "Sorry, this deal cannot be paid with the selected payment method. Choose another".localized)
        static let nameIsMissing: NSError = ErrorsFactory.error(with: "To make a purchase, you must specify the name and surname".localized)
        static let addressIsMissing: NSError = ErrorsFactory.error(with: "To purchase coupons, you must specify the address in the profile settings".localized)
    }

    struct Coupons {
        static let share: NSError = ErrorsFactory.error(with: "An error occurred while sending the coupon by email. Please try again later.".localized)
        static let mail: NSError = ErrorsFactory.error(with: "To send e-mail messages, you must configure the program \"Mail\"".localized)
    }

    struct Parsing {
        static let invalidJson: NSError = ErrorsFactory.error(with: "The response from the server is not valid".localized)
        static let invalidPushNotification: NSError = ErrorsFactory.error(with: "Push Notification Not Valid".localized)
    }

    struct SocialAuth {
        static let emailIsMissing: NSError = ErrorsFactory.error(with: "Email is missing".localized)
        static let tokenIsInvalid: NSError = ErrorsFactory.error(with: "Token invalid".localized)
        static let cancelled: NSError = ErrorsFactory.error(with: "User canceled request".localized)
        static let noAccess: NSError = ErrorsFactory.error(with: "No access".localized)
    }

    struct ResetPassword {
        static let emailIsMissing: NSError = ErrorsFactory.error(with: "User with such email not found".localized)
    }

    struct AuthFields {
        static let emailIsInvalid: NSError = ErrorsFactory.error(with: "Email is not correct".localized)
        static let numberIsInvalid: NSError = ErrorsFactory.error(with: "Phone number is not correct".localized)
        static let emailIsEmpty: NSError = ErrorsFactory.error(with: "Enter email".localized)
        static let passwordIsEmpty: NSError = ErrorsFactory.error(with: "Enter password".localized)
        static let passwordContainsSpaces: NSError = ErrorsFactory.error(with: "Password must not contain spaces".localized)
        static let passwordIsShort: NSError = ErrorsFactory.error(with: "Password is too short".localized)
        static let passwordsIsNotSame: NSError = ErrorsFactory.error(with: "Passwords do not match".localized)
        static let storeIsNotSelected: NSError = ErrorsFactory.error(with: "City not selected".localized)
        static let needAgreement: NSError = ErrorsFactory.error(with: "To continue, you must agree to the terms of the User Agreement and the Privacy Agreement".localized)
    }

    struct Feedback {
        static let emailIsInvalid: NSError = ErrorsFactory.error(with: "Email is not correct".localized)
        static let emailIsEmpty: NSError = ErrorsFactory.error(with: "Email is missing".localized)
        static let nameIsEmpty: NSError = ErrorsFactory.error(with: "Missing Name".localized)
        static let categoryIsEmpty: NSError = ErrorsFactory.error(with: "Category not selected".localized)
        static let bodyIsEmpty: NSError = ErrorsFactory.error(with: "No message".localized)
    }

    struct User {
        static let notAuthorized: NSError = ErrorsFactory.error(with: "User not authorized".localized, code: 401)
        static let invalidEmail: NSError = ErrorsFactory.error(with: "Email is invalid".localized)
        static let passIsEmpty: NSError = ErrorsFactory.error(with: "Enter password".localized)
        static let invalidName: NSError = ErrorsFactory.error(with: "Name is invalid".localized)
        static let emptyFields: NSError = ErrorsFactory.error(with: "Empty fields".localized)
    }
    
    struct BiometricAuth {
        
        static let authenticationFailed: NSError = ErrorsFactory.error(with: "There was a problem verifying your identity".localized)
        static let userCancel: NSError = ErrorsFactory.error(with: "You pressed cancel".localized)
        static let userFallback: NSError = ErrorsFactory.error(with: "You pressed password".localized)
        static let biometryNotAvailable: NSError = ErrorsFactory.error(with: "Face ID/Touch ID is not available".localized)
        static let biometryNotEnrolled: NSError = ErrorsFactory.error(with: "Face ID/Touch ID is not set up".localized)
        static let biometryLockout: NSError = ErrorsFactory.error(with: "Face ID/Touch ID is locked".localized)
        static let defaultBiometricAuth: NSError = ErrorsFactory.error(with: "Face ID/Touch ID may not be configured".localized)
        
    }

    private static func error(with message: String, code: Int = 0) -> NSError {
        return NSError(domain: "", code: code, userInfo: [NSLocalizedDescriptionKey: message.localized])
    }
}
