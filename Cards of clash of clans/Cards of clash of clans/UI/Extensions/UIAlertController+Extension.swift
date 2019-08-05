//
//  UIAlertController+Extension.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/4/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    func createAction(title: String, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: .default, handler: handler)
        return action
    }
}
