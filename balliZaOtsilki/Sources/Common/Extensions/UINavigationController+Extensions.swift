//
//  UINavigationController+Extensions.swift
//  GetMe
//
//  Created by Vladyslav Vdovycheko on 08.12.2020.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func popViewControllerWithHandler(completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.popViewController(animated: true)
        CATransaction.commit()
    }
    func pushViewController(viewController: UIViewController, completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        self.pushViewController(viewController, animated: true)
        CATransaction.commit()
    }
}
