//
//  TutorialWireframe.swift
//  balliZaOtsilki
//
//  Created by Vladyslav Vdovychenko on 27.12.2020.
//

import Foundation
import UIKit

class TutorialWireframe: BaseWireframe {

    override func storyboardName() -> String {
        return "Tutorial"
    }

    override func identifier() -> String {
        return "TutorialViewController"
    }

    func presentIn(_ parent: UIViewController, delegate: TutorialViewControllerDelegate) {
        if let destination: TutorialViewController = initializeController() {
            destination.tutorialDelegate = delegate

            self.presentedViewController = destination
            destination.modalPresentationStyle = .fullScreen

            parent.present(destination, animated: true, completion: nil)
        }
    }
}
