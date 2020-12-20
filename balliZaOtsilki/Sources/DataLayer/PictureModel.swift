//
//  PictureModel.swift
//  GetMe
//
//  Created by Vladyslav Vdovycheko on 06.11.2020.
//

import Foundation

class Picture: BaseModel {
    
    private(set) var id: Int = 0
    private var urlString: String?
    private(set) var url: URL?
    
    override func updateFullFrom(_ dict: NSDictionary) {
        self.updateBaseFrom(dict)
    }
    
    override func updateBaseFrom(_ dict: NSDictionary) {
        if let dictionary = dict as? [String: Any] {
            if let urlString = dictionary["logo"] as? String {
                self.urlString = urlString
                self.url = URL(string: urlString)
            }
        }
    }
    
}
