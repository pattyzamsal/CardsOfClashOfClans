//
//  BasePresenter.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/1/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation

protocol BaseViewProtocol {
    func alertErrorsWithRepeat(title: String, message: String)
}

protocol BaseModelProtocol {
    func sendMessageWithRepeat(title: String, message: String)
}
