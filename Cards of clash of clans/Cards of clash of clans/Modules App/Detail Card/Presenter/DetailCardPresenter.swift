//
//  DetailCardPresenter.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/4/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation

protocol DetailCardViewProtocol: BaseViewProtocol {
    func onSuccessImageData(imageData: Data)
}

protocol DetailCardModelProtocol: BaseModelProtocol {
    func onSuccessImageData(imageData: Data)
}
