//
//  ListCardsModel.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/4/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation

class ListCardsModel: BaseModel {
    private var view: ListCardsViewProtocol
    
    init(view: ListCardsViewProtocol) {
        self.view = view
        super.init(view: view)
    }
    
    func obtainAllCards() {
        if APIClient.validateConnectInternet() {
            APIClient.getAllCards { (cards) in
                if let listCards = cards {
                    self.onSuccessListCards(cards: listCards)
                } else {
                    self.sendMessageWithRepeat(title: TextsApps.errorWithDownloadTitle.rawValue, message: TextsApps.errorWithDownloadMessage.rawValue)
                }
            }
        } else {
            self.sendMessageWithRepeat(title: TextsApps.withoutInternetTitle.rawValue, message: TextsApps.withoutInternetMessage.rawValue)
        }
    }
}

extension ListCardsModel: ListCardsModelProtocol {
    func onSuccessListCards(cards: [CardDecodable]) {
        self.view.onSuccessListCards(cards: cards)
    }
}
