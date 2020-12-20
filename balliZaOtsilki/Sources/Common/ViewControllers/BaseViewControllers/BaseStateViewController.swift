//
//  BaseStateViewController.swift
//  GetMe
//
//  Created by Vladyslav Vdovycheko on 09.10.2020.
//

import UIKit

class BaseStateViewController: BaseViewController, StatesViewsDataSource, ReloadContentViewDelegate, NothingViewDelegate {
    
    fileprivate lazy var statesHandler = { return StatesViewsHandler() }()
    
    var isLoading: Bool = false


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func changeState(_ state: ViewState, view: UIView? = nil) {
        if self.statesHandler.currentState == state { return }
        if let view = view {
            self.statesHandler.change(state: state, onView: view, dataSource: self)
        } else {
            self.statesHandler.change(state: state, onView: self.view, dataSource: self)
        }
    }
    
    // MARK: - States Views
    
    func initialView() -> UIView {
        let view = UIView()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .tertiarySystemBackground
        } else {
            view.backgroundColor = .white
        }
        
        return view
    }
    
    func contentView() -> UIView {
        return self.view
    }
    
    func loadingView() -> UIView {
        let view = LoadingView.shared
        view.playAnimationView()
        return view
    }
    
    func errorView() -> UIView {
        let view = UINib(nibName: "ReloadContentView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ReloadContentView
        view.title = "An error occurred while loading data".localized
        view.buttonTitle = "Reload".localized
        view.delegate = self
        return view
    }
    
    func nothingView() -> UIView {
        let view = UINib(nibName: "NothingView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NothingView
        view.delegate = self
        return view
    }
    
    // MARK: - State Delegates (Must override)
    
    func didTapOnNothingViewButton(_ view: NothingView, sender: UIButton) {
        // do not call super.openPage()!
        fatalError("Must initialize openPage")
    }
    
    func reloadContentView(_ view: ReloadContentView, sender: UIButton) {
        // do not call super.reloadContentView()!
        fatalError("Must initialize reloadContentView")
    }

}
