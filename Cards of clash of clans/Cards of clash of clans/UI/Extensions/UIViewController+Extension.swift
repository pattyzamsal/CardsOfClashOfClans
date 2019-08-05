//
//  UIViewController+Extension.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/4/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func createAlertView(title: String,
                         message: String,
                         hasCancelButton: Bool,
                         handlerAccept: ((UIAlertAction) -> Void)? = nil,
                         handlerCancel: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if hasCancelButton {
            alert.addAction(alert.createAction(title: TextsApps.cancel.rawValue, handler: handlerCancel))
        }
        alert.addAction(alert.createAction(title: TextsApps.accept.rawValue, handler: handlerAccept))
        
        return alert
    }
}
