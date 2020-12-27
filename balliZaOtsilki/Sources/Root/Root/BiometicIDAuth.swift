//
//  BiometicIDAuth.swift
//  SuperDealNew
//
//  Created by iosdev on 23.06.2020.
//  Copyright © 2020 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation
import LocalAuthentication


enum BiometricType {
    case none
    case touchID
    case faceID
}

class BiometricIDAuth {
    
    var context = { LAContext() }()
    
    fileprivate func isBiometricEnabledInSettings() -> Bool {
        return BiometricDataWrapper.shared.isBiometricActivated
    }
    
    func canEvaluatePolicy() -> Bool {
        if isBiometricEnabledInSettings() {
            return context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
        } else { return false } 
    }
    
    @available(iOS 11.0, *)
    func biometricType() -> BiometricType {
      let _ = context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
      switch context.biometryType {
      case .none:
        return .none
      case .touchID:
        return .touchID
      case .faceID:
        return .faceID
      @unknown default:
        fatalError()
        }
    }
    
    func createLoginReason() -> String? {
        if #available(iOS 11.0, *) {
            switch biometricType() {
            case .faceID:
                return "Logging in with Face ID".localized
            case .touchID:
                return "Logging in with Touch ID".localized
            case .none:
                return nil
            }
        } else {
            return nil
        }
    }
    
    @available(iOS 11.0, *)
    func authenticateUser(completion: @escaping () -> Void, failure: @escaping FailureCallback) {
        
        guard canEvaluatePolicy() else { return }
        guard let reason = createLoginReason() else { return }
        
        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { (success, evaluateError) in
            if success {
                DispatchQueue.main.async {
                    // User authenticated successfully, take appropriate action
                    completion()
                }
            } else {
                let error: NSError
                                      
                switch evaluateError {
                case LAError.authenticationFailed?:
                    error = ErrorsFactory.BiometricAuth.authenticationFailed
                case LAError.userCancel?:
                    error = ErrorsFactory.BiometricAuth.userCancel
                case LAError.userFallback?:
                  error = ErrorsFactory.BiometricAuth.userFallback
                case LAError.biometryNotAvailable?:
                  error = ErrorsFactory.BiometricAuth.biometryNotAvailable
                case LAError.biometryNotEnrolled?:
                  error = ErrorsFactory.BiometricAuth.biometryNotEnrolled
                case LAError.biometryLockout?:
                  error = ErrorsFactory.BiometricAuth.biometryLockout
                default:
                  error = ErrorsFactory.BiometricAuth.defaultBiometricAuth
                }
                failure(error)
            }
        }
    }
    
    
}
