//
//  ErrorsHandlerInterface.swift
//  GetMe
//
//  Created by Vladyslav Vdovycheko on 30.09.2020.
//

import Foundation


protocol ErrorsHandlerInterface: class {
    func handleError(_ error: NSError?)
    func handleWarning(_ title: String?, message: String?, proceed:@escaping () -> Void, cancel:@escaping () -> Void)
}
