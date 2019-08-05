//
//  ListCardsPresenter.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/4/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation

protocol ListCardsViewProtocol: BaseViewProtocol {
    func onSuccessListCards(cards: [CardDecodable])
}

protocol ListCardsModelProtocol: BaseModelProtocol {
    func onSuccessListCards(cards: [CardDecodable])
}
