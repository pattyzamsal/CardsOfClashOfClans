//
//  ComponentViewDelegate.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/4/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import UIKit

protocol ComponentViewDelegate {
    func add(view: UIView, isProgressView: Bool)
    
    func center(view: UIView)
    
    func bottom(view: UIView)
}
