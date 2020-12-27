//
//  RootInteractor.swift
//  balliZaOtsilki
//
//  Created by Vladyslav Vdovychenko on 27.12.2020.
//

import Foundation

class RootInteractor: BaseInteractor {
    
    weak var view: RootOutputProtocol?
    
}

extension RootInteractor: RootInputProtocol {
    
    func setTutorialState(_ state: Bool) {
        TutorialDataWrapper.shared.haveOpenedTheTutorial = state
    }
    
    
    func retrieveTutorialState() {
        self.view?.didReceiveTutorialState(TutorialDataWrapper.shared.haveOpenedTheTutorial)
    }
    
}
