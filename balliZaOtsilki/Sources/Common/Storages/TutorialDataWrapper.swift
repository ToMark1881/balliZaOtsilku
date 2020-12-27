//
//  TutorialDataWrapper.swift
//  GetMe
//
//  Created by Vladyslav Vdovycheko on 30.09.2020.
//

import Foundation
import SwiftKeychainWrapper

class TutorialDataWrapper {
    
    private static let tutorialTokenKey = "DataWrapper.Tutorial"
    private init() {}
    static let shared = TutorialDataWrapper()
    
    var haveOpenedTheTutorial: Bool? {
        get {
            return KeychainWrapper.standard.bool(forKey: TutorialDataWrapper.tutorialTokenKey)
        }
        set (updatedValue) {
            guard (updatedValue != nil) else { return }
            KeychainWrapper.standard.set(updatedValue!, forKey: TutorialDataWrapper.tutorialTokenKey)
        }
    }
    
}
