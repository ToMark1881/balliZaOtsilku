//
//  StatesViewHandler.swift
//  SuperDealNew
//
//  Created by Yaroslav Tytarenko on 9/28/17.
//  Copyright © 2017 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation
import UIKit

protocol StatesHandler: class {
    func change(state: ViewState, onView: UIView, dataSource: StatesViewsDataSource)
}


class StatesViewsHandler {
    
    var currentState: ViewState?
    var cachedViews: [ViewState: UIView] = [ViewState: UIView]()
    
    func change(state: ViewState, onView: UIView, dataSource: StatesViewsDataSource) {
        self.currentState = state
        var stateView: UIView!
        
        if let view = self.cachedViews[state] {
            stateView = view
            
        } else {
            switch state {
            case .content:
                stateView = dataSource.contentView()
                self.cachedViews[state] = stateView
            case .loading:
                stateView = dataSource.loadingView()
            case .error:
                stateView = dataSource.errorView()
            case .nothing:
                stateView = dataSource.nothingView()
            case .initial:
                stateView = dataSource.initialView()
            }
            
            if !isViewContainsOnParentView(subview: stateView, parentView: onView) {
                stateView.translatesAutoresizingMaskIntoConstraints = false
                onView.addSubview(stateView)
                stateView.bindOnAllSidesLayouts(parentView: onView)
            }
        }
        
        for subview in onView.subviews {
            subview.isHidden = (subview != stateView)
        }
    }
    
    fileprivate func isViewContainsOnParentView(subview: UIView, parentView: UIView) -> Bool {
        if parentView == subview {
            return true
        }
        
        for sub in parentView.subviews {
            if sub == subview {
                return true
            }
        }
        
        return false
    }
}
