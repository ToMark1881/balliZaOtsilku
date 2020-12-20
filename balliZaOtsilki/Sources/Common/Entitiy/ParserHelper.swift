//
//  ParserHelper.swift
//  GetMe
//
//  Created by Vladyslav Vdovycheko on 12.10.2020.
//

import Foundation


class ParserHelper {
    
    class func convertDataToArray(_ data: Data?) throws -> NSArray? {
        if let data = data {
            return try JSONSerialization.jsonObject(with: data, options: []) as? NSArray
        } else {
            return nil
        }
    }
    
    class func convertDataToDictionary(_ data: Data?) throws -> NSDictionary? {
        if let data = data {
            return try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
        } else {
            return nil
        }
    }
}
