//
//  NothingView.swift
//  GetMe
//
//  Created by Vladyslav Vdovycheko on 09.10.2020.
//

import UIKit

protocol NothingViewDelegate: class {
    
    func didTapOnNothingViewButton(_ view: NothingView, sender: UIButton)
    
}

class NothingView: UIView {

    @IBOutlet weak var nothingImageView: UIImageView!
    @IBOutlet weak var nothingTitleLabel: UILabel!
    @IBOutlet weak var nothingDescriptionLabel: UILabel!
    @IBOutlet weak var actionButton: BounceButton!
    
    weak var delegate: NothingViewDelegate?
    
    func setNothingView(image: UIImage, title: String = "Хм...", description: String, buttonTitle: String, buttonImage: UIImage? = nil) {
        self.nothingImageView.image = image
        self.nothingTitleLabel.text = title
        self.nothingDescriptionLabel.text = description
        self.actionButton.setTitle(buttonTitle, for: .normal)
        if let image = buttonImage {
            self.actionButton.setImage(image, for: .normal)
        }
    }
    
    @IBAction func didTapOnActionButton(_ sender: BounceButton) {
        self.delegate?.didTapOnNothingViewButton(self, sender: sender)
    }
    
}
