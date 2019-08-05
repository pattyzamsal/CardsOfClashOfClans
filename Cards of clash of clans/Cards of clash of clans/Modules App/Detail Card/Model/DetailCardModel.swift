//
//  DetailCardModel.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/4/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation

class DetailCardModel: BaseModel {
    private var view: DetailCardViewProtocol
    
    init(view: DetailCardViewProtocol) {
        self.view = view
        super.init(view: view)
    }
    
    func getImage(idName: String) {
        if APIClient.validateConnectInternet() {
            APIClient.downloadPhoto(idName: idName) { (imageData) in
                if let imgData = imageData {
                    self.onSuccessImageData(imageData: imgData)
                } else {
                    self.sendMessageWithRepeat(title: TextsApps.errorWithDownloadTitle.rawValue, message: TextsApps.errorWithDownloadMessage.rawValue)
                }
            }
        } else {
            self.sendMessageWithRepeat(title: TextsApps.withoutInternetTitle.rawValue, message: TextsApps.withoutInternetMessage.rawValue)
        }
    }
}

extension DetailCardModel: DetailCardModelProtocol {
    func onSuccessImageData(imageData: Data) {
        self.view.onSuccessImageData(imageData: imageData)
    }
}
