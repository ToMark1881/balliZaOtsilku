//
//  AppDelegate.swift
//  balliZaOtsilki
//
//  Created by Vladyslav Vdovychenko on 20.12.2020.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var reachability: Reachability = Reachability()
    var servicesContainer: ServicesContainer!
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                
        self.initServices()
        
        self.configureRootViewController()
        
        self.initFrameworks()
        
        self.setupUIAppearance()
        
        self.reachability.monitorReachabilityChanges()
        return true
    }
    
}
// MARK: - Additional Methods
extension AppDelegate {
    
    fileprivate func setupUIAppearance() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: ApplicationColors.textColor, NSAttributedString.Key.font: ApplicationFonts.mediumWithSize(16)]
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: ApplicationColors.textColor, NSAttributedString.Key.font: ApplicationFonts.mediumWithSize(16)], for: .normal)
        
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: ApplicationColors.textColor, NSAttributedString.Key.font: ApplicationFonts.mediumWithSize(16)], for: .highlighted)
        
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: ApplicationColors.textColor, NSAttributedString.Key.font: ApplicationFonts.mediumWithSize(16)], for: .focused)
        
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: ApplicationFonts.mediumWithSize(16)], for: .disabled)
        
        UINavigationBar.appearance().barTintColor = ApplicationColors.textColor
        UINavigationBar.appearance().tintColor = ApplicationColors.textColor
        UIBarButtonItem.appearance().tintColor = ApplicationColors.textColor
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().backgroundColor = .clear
        
        UITabBar.appearance().backgroundImage = UIImage(color: ApplicationColors.backgroundColor)
        UITabBar.appearance().shadowImage = UIImage(color: ApplicationColors.backgroundColor)
        UITabBar.appearance().clipsToBounds = true
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: ApplicationFonts.mediumWithSize(12)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: ApplicationFonts.mediumWithSize(12)], for: .selected)
    }
    
    fileprivate func initServices() {
        self.servicesContainer = ServicesContainer()
    }
    
    fileprivate func initFrameworks() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.placeholderFont = ApplicationFonts.mediumWithSize(14)
        IQKeyboardManager.shared.toolbarTintColor = ApplicationColors.textColor
        
        FirebaseApp.configure()
    }
    
    fileprivate func configureRootViewController() {
//        let storyboard = UIStoryboard(name: "Content", bundle: nil)
//        let rootViewController: (RootOutputProtocol & UIViewController) = storyboard.instantiateViewController(withIdentifier: "RootViewController") as! RootViewController
//        let interactor: RootInputProtocol = RootInteractor()
//        rootViewController.interactor = interactor
//        interactor.view = rootViewController
//        if let window = self.window {
//            window.rootViewController = rootViewController
//        }
    }
    
}

