//
//  BaseModel.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/1/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation

class BaseModel {
    
    private var view: BaseViewProtocol
    
    init(view: BaseViewProtocol) {
        self.view = view
    }
}

extension BaseModel: BaseModelProtocol {
    func sendMessageWithRepeat(title: String, message: String) {
        self.view.alertErrorsWithRepeat(title: title, message: message)
    }
}
