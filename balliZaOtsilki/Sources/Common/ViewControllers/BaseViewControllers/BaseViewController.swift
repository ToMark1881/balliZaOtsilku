//
// Created by Pokupon & SuperDeal Mobile Team on 12/7/16.
// Copyright (c) 2016 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation
import UIKit


class BaseViewController: UIViewController {

    fileprivate var deferedError: NSError?
    fileprivate var visible: Bool = false
    fileprivate lazy var loadingSpinner: UIAlertController = { return AlertController.shared.spinner() }()
    fileprivate var isLoadingSpinnerPresenting = false
    
    fileprivate lazy var locationService = { return LocationService() }()
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
        }
    }
    
    var needToHideNavigationBar: Bool = false
    
    var needToSubscribeToKeyboardEvents: Bool = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        Logger.shared.log("🆕 required init \(self)", type: .lifecycle)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        Logger.shared.log("🆕 override init \(self)", type: .lifecycle)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = false
        }
        subscribeToNetworkStateChanges()
        Logger.shared.log("viewDidLoad \(self)", type: .lifecycle)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if needToHideNavigationBar {
            self.navigationController?.setNavigationBarHidden(true, animated: animated) //hide
        }
        if needToSubscribeToKeyboardEvents {
            self.subscribeToKeyboardChanges()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.visible = true

        if self.deferedError != nil {
            showError(self.deferedError!)
        }
        
		Logger.shared.log("viewDidAppear \(self)", type: .lifecycle)
		
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromNetworkStateChanges()
        if needToHideNavigationBar {
            self.navigationController?.setNavigationBarHidden(false, animated: animated) //show
        }
        
        if needToSubscribeToKeyboardEvents {
            self.unsubscribeFromKeyboardChanges()
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        self.visible = false
        
        Logger.shared.log("viewDidDisappear \(self)", type: .lifecycle)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard UIApplication.shared.applicationState == .inactive else { return }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        Logger.shared.log("😱 \(self)", type: .lifecycle)
    }

    deinit {
        Logger.shared.log("🗑 \(self)", type: .lifecycle)
    }
    
    func setupTitle(_ title: String) {
        self.navigationController?.navigationBar.topItem?.title = title
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    func showLoadingSpinner(animated: Bool = true, completion: (()-> Void)? = nil) {
        DispatchQueue.main.async {
            if self.isLoadingSpinnerPresenting {
                return
            }
            else {
                self.isLoadingSpinnerPresenting = true
                self.present(self.loadingSpinner, animated: animated, completion: completion)
            }
        }
    }
    
    func dismissLoadingSpinner(animated: Bool = true, completion: (()-> Void)? = nil) { //Use this method!
        DispatchQueue.main.async {
            if self.isLoadingSpinnerPresenting {
                self.loadingSpinner.dismiss(animated: animated, completion: {
                    self.isLoadingSpinnerPresenting = false
                    completion?()
                })
            } else { completion?() }
        }
    }
    
    func isLocationServiceAvaliable() -> Bool {
        return self.locationService.locationServicesEnabled()
    }
    
    // MARK: - Application Events
    final func subscribeToApplicationEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.applicationDidBecomeActive(_:)), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    final func unsubscribeFromApplicationEvents() {
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    @objc func applicationDidBecomeActive(_ application: UIApplication) {
        // Override
    }
    
    // MARK: - Network
    @objc func networkChanged(notification: NSNotification) {
        // Override
        if !Reachability.isConnectedToNetwork() {
            self.deferedError = nil
        }
    }
    
    final func subscribeToNetworkStateChanges() {
        NotificationCenter.default.addObserver(self, selector: #selector(networkChanged(notification:)), name: ReachabilityStatusChangedNotification, object: nil)
    }
    
    final func unsubscribeFromNetworkStateChanges() {
        NotificationCenter.default.removeObserver(self, name: ReachabilityStatusChangedNotification, object: nil)
    }
    
    // MARK: - Keyboard
    final func subscribeToKeyboardChanges() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    final func unsubscribeFromKeyboardChanges() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        // Override
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        // Override
    }

    // MARK: - Close modal controller
    func showCloseButton() {
        let closeBtn = UIBarButtonItem(title: "Close".localized, style: .plain, target: self, action: #selector(BaseViewController.didTapToClose(_:)))
        closeBtn.tintColor = .white

        self.navigationItem.rightBarButtonItems = [closeBtn]
    }

    @objc func didTapToClose(_ sender: UIBarButtonItem) {
        self.view.endEditing(true)

        self.navigationController?.dismiss(animated: true, completion: nil)
    }

    // MARK: - Fileprivate
    fileprivate func deferError(_ error: NSError) {
        self.deferedError = error
    }
    
    fileprivate func showSuccess(_ title: String = "", description: String) {
        if EntryKitAlertController.shared.isDisplayed() {
            return
        }
        EntryKitAlertController.shared.displayAlert(title: title, message: description, notificationType: .success) {
            return
        }
    }

    fileprivate func showError(_ error: NSError) {
        guard error.code != ErrorsFactory.General.processIsBusy.code else {
            return
        }
        
        if EntryKitAlertController.shared.isDisplayed() {
            return
        }
        if error.code == ErrorsFactory.General.connection.code {
            EntryKitAlertController.shared.displayAlert(title: "", message: error.localizedDescription, notificationType: .error) {
                self.deferedError = nil
            }
            return
        }
        EntryKitAlertController.shared.displayAlert(title: "Error".localized, message: error.localizedDescription, notificationType: .error) {
            self.deferedError = nil
        }
    }
}

extension BaseViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension BaseViewController: ErrorsHandlerInterface {

    @objc func handleError(_ error: NSError?) {
        
        guard error != nil else {
            return
        }
        self.dismissLoadingSpinner {
            if (self.isViewLoaded && self.view.window != nil && self.visible) {
                self.showError(error!)
            } else {
                self.deferError(error!)
            }
        }
    }
    
    func handleSuccess(message: String) {
        self.dismissLoadingSpinner {
            self.showSuccess(description: message)
        }
    }
    
    func handleWarning(_ title: String?, message: String?, proceed:@escaping () -> Void, cancel:@escaping () -> Void) {
        DispatchQueue.main.async(execute: { () -> Void in
            AlertController.alert(title ?? "", message: message ?? "", buttons: ["Cancel".localized, "Continue".localized], tapBlock: { (alert: UIAlertAction, index: Int) in
                if index == 0 {
                    cancel()
                } else {
                    proceed()
                }
            })
        })
    }
}
