//
//  ReloadContentView.swift
//  SuperDealNew
//
//  Created by Pokupon & SuperDeal on 10/16/17.
//  Copyright © 2017 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation
import UIKit

protocol ReloadContentViewDelegate: class {
    func reloadContentView(_ view: ReloadContentView, sender: UIButton)
}


class ReloadContentView: UIView {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var title: String = "" {
        didSet {
            self.label?.text = title
        }
    }
    
    var buttonTitle: String = "" {
        didSet {
            self.button?.setTitle(buttonTitle, for: .normal)
        }
    }
    
    weak var delegate: ReloadContentViewDelegate?

    @IBAction func tapOnRetryButton(_ sender: UIButton) {
        self.delegate?.reloadContentView(self, sender: sender)
    }
}
