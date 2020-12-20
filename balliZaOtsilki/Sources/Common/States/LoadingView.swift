//
//  LoadingView.swift
//  test
//
//  Created by Yaroslav Tytarenko on 9/28/17.
//  Copyright © 2017 Yaroslav Tytarenko. All rights reserved.
//

import Foundation
import UIKit


class LoadingView: UIView {
    
    static var shared = LoadingView() //singleton для экономии Memory
            
    private var activityLoader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.hidesWhenStopped = true
        loader.style = .whiteLarge
        loader.color = ApplicationColors.textColor
        return loader
    }()
    
    override private init(frame: CGRect) {
        super.init(frame: frame)
        loadBasicAnimation()
    }
    
    private func loadBasicAnimation() {
        self.addSubview(activityLoader)
        activityLoader.translatesAutoresizingMaskIntoConstraints = false
        activityLoader.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityLoader.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        activityLoader.heightAnchor.constraint(equalToConstant: 100).isActive = true
        activityLoader.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.backgroundColor = ApplicationColors.backgroundColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        playAnimationView()
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        playAnimationView()
    }
    
    func playAnimationView() {
        if !activityLoader.isAnimating {
            activityLoader.startAnimating()
        }
    }
    
    deinit {
        activityLoader.stopAnimating()
        print("LoadingView deinit")
    }
}
