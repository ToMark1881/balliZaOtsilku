//
//  RootViewController.swift
//  balliZaOtsilki
//
//  Created by Vladyslav Vdovychenko on 27.12.2020.
//

import UIKit

enum RootState {
    case tutorial
    case auth
    case none
    case logged
    case biometricAuth
}

class RootViewController: BaseViewController {
    
    fileprivate lazy var tutorialWireframe = { TutorialWireframe() }()
    
    var interactor: RootInputProtocol?
    
    fileprivate var currentUserState: RootState = .none

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.initializeSession()
        }
    }
    
    fileprivate func initializeSession() {
        self.interactor?.retrieveTutorialState()
    }
    
    fileprivate func showTutorialController() {
        self.changeCurrentState(.tutorial)
        self.tutorialWireframe.presentIn(self, delegate: self)
    }
    
    fileprivate func changeCurrentState(_ state: RootState) {
        self.currentUserState = state
    }

}

extension RootViewController: RootOutputProtocol {
    
    func didReceiveTutorialState(_ isTutorialAlreadyDisplayed: Bool?) {
        if isTutorialAlreadyDisplayed == true && currentUserState == .none {
            //self.showPhoneNumberController()
        }
        else {
            self.showTutorialController()
        }
    }
    
}

extension RootViewController: TutorialViewControllerDelegate {
    
    func tutorialViewControllerDidComplete() {
        self.tutorialWireframe.dismissViewController(animated: true, completion: {
            //self.interactor?.setTutorialState(true)
            //self.showPhoneNumberController()
        })
    }
    
}
