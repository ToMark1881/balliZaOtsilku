//
//  RootProtocols.swift
//  balliZaOtsilki
//
//  Created by Vladyslav Vdovychenko on 27.12.2020.
//

import Foundation

protocol RootInputProtocol: class {
    
    var view: RootOutputProtocol? { get set }
    
    func retrieveTutorialState()
    
    func setTutorialState(_ state: Bool)
    /*
    func retrieveUserProfile()
    
    func retrieveBiometricStatus()
 */
}

protocol RootOutputProtocol: class {
    
    var interactor: RootInputProtocol? { get set }
    
    func didReceiveTutorialState(_ isTutorialAlreadyDisplayed: Bool?)
    
    /*
    func didReceiveUserProfile()
    
    func didReceiveBiometricConfirmation()
    
    func didReceiveError(_ error: NSError?)
 */
}
