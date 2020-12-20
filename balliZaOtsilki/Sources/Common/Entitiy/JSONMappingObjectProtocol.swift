//
//  JSONMappingObjectProtocol.swift
//  GetMe
//
//  Created by Vladyslav Vdovycheko on 12.10.2020.
//

import Foundation


protocol JSONMappingObject: class {
    
    func updateBaseFrom(_ dict: NSDictionary)
    func updateFullFrom(_ dict: NSDictionary)
}
