//
//  ErrorView.swift
//  test
//
//  Created by Yaroslav Tytarenko on 9/28/17.
//  Copyright © 2017 Yaroslav Tytarenko. All rights reserved.
//

import Foundation
import UIKit


class ErrorView: UIView {
    
    var title = "Internet error".localized
    var buttonTitle = "Try Again".localized
    
    fileprivate var label: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if #available(iOS 13.0, *) {
            self.backgroundColor = .tertiarySystemBackground
        }
        else {
            self.backgroundColor = .white
        }
        self.label = UILabel(frame: frame)
        self.label?.textAlignment = .center
        self.label?.numberOfLines = 0
        self.label?.text = title
        self.label?.font = ApplicationFonts.mediumWithSize(16)
        self.label?.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.label!)
        self.label?.bindOnAllSidesLayouts(parentView: self, offcet: 16)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
