//
//  AlamofireSource.swift
//  SuperDealNew
//
//  Created by Pokupon & SuperDeal on 7/14/17.
//  Copyright © 2017 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation
import UIKit

public class ImageInputSource: NSObject, InputSource {
    
    public var url: URL
    public var placeholder: UIImage?
    
    fileprivate lazy var imageService = { return ImageService.shared }()
    
    public init(url: URL, placeholder: UIImage? = nil) {
        self.url = url
        self.placeholder = placeholder
        
        super.init()
    }

    public init?(urlString: String, placeholder: UIImage? = nil) {
        if let validUrl = URL(string: urlString) {
            self.url = validUrl
            self.placeholder = placeholder
            
            super.init()
        } else {
            return nil
        }
    }
    
    public func load(to imageView: UIImageView, with callback: @escaping (UIImage?) -> Void) {
        self.imageService.loadInto(imageView, url: self.url, completion: callback)
    }
}
