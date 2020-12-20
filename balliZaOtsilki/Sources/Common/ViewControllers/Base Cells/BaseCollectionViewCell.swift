//
//  BaseCollectionViewCell.swift
//  GetMe
//
//  Created by Vladyslav Vdovycheko on 28.10.2020.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(with object: AnyObject) { //for override
        // do not call super.setupCell()!
        fatalError("Need to override")
    }
    
}
