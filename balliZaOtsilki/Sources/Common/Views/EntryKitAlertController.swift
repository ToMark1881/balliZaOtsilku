//
//  EntryKitAlertController.swift
//  GetMe
//
//  Created by Vladyslav Vdovycheko on 08.10.2020.
//

import SwiftEntryKit
import UIKit

class EntryKitAlertController {
    
    static let shared = EntryKitAlertController()
    
    func displayAlert(title: String, message: String, notificationType: EKAttributes.NotificationHapticFeedback = .warning, completed: @escaping (() -> ())) {
        
        var attributes = EKAttributes.topNote
        attributes.entryBackground = .color(color: EKColor(red: 255, green: 241, blue: 0)) //standart yellow
        attributes.shadow = .none
        attributes.statusBar = .inferred
        attributes.lifecycleEvents.didDisappear = completed
        attributes.hapticFeedbackType = notificationType
        
        let title = EKProperty.LabelContent(text: title, style: .init(font: ApplicationFonts.boldWithSize(16), color: .black))
        let description = EKProperty.LabelContent(text: message, style: .init(font: ApplicationFonts.mediumWithSize(14), color: .black))
        let notificationImage: UIImage = notificationType == .success ? UIImage(named: "Success-Icon")! : UIImage(named: "Failure-Icon")!
        let image = EKProperty.ImageContent(image: notificationImage, size: CGSize(width: 28, height: 28))
        let simpleMessage = EKSimpleMessage(image: image, title: title, description: description)
        let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)

        let contentView = EKNotificationMessageView(with: notificationMessage)
        SwiftEntryKit.display(entry: contentView, using: attributes)
        
    }
    
    func isDisplayed() -> Bool {
        return SwiftEntryKit.isCurrentlyDisplaying
    }
    
    
}
