//
//  StatesViewController.swift
//  SuperDealNew
//
//  Created by Yaroslav Tytarenko on 9/28/17.
//  Copyright © 2017 SuperDeal Limited Liability Company. All rights reserved.
//

import UIKit

enum ViewState: String {
    case initial
    case content
    case loading
    case error
    case nothing
}


protocol StatesViewsDataSource: class {
    func initialView() -> UIView
    func contentView() -> UIView
    func loadingView() -> UIView
    func errorView() -> UIView
    func nothingView() -> UIView
}
