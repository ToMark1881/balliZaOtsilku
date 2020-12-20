//
//  BaseModel.swift
//  GetMe
//
//  Created by Vladyslav Vdovycheko on 12.10.2020.
//

import Foundation

class BaseModel: NSObject, JSONMappingObject {
    
    func updateBaseFrom(_ dict: NSDictionary) {
        // do not call super.updateBaseFrom()!
        fatalError("Must initialize updateBaseFrom")
    }
    
    func updateFullFrom(_ dict: NSDictionary) {
        // do not call super.updateFullFrom()!
        fatalError("Must initialize updateFullFrom")
    }
    
}
