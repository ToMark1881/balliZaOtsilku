//
//  BiometricDataWrapper.swift
//  GetMe
//
//  Created by Vladyslav Vdovycheko on 19.10.2020.
//

import Foundation
import SwiftKeychainWrapper

class BiometricDataWrapper {
    
    private static let biometricTokenKey = "DataWrapper.Biometric"
    private init() {}
    static let shared = BiometricDataWrapper()
    
    var isBiometricActivated: Bool {
        get {
            if let bool = KeychainWrapper.standard.bool(forKey: BiometricDataWrapper.biometricTokenKey) {
                return bool
            }
            return false
        }
        set (updatedValue) {
            KeychainWrapper.standard.set(updatedValue, forKey: BiometricDataWrapper.biometricTokenKey)
        }
    }
    
}
