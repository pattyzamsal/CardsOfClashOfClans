//
//  DetailCardVC.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/3/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import UIKit

class DetailCardVC: BaseVC {

    @IBOutlet weak var imgCard: UIImageView!
    @IBOutlet weak var lbDescriptionCard: UILabel!
    
    var specificCard: CardDecodable!
    
    private lazy var presenter = DetailCardModel(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem?.title = ""
        self.navigationItem.title = specificCard.name
        
        if specificCard.description != nil {
            lbDescriptionCard.text = specificCard.description
        } else {
            lbDescriptionCard.text = TextsApps.noDescription.rawValue
        }
        
        showProgress()
        presenter.getImage(idName: specificCard.idName)
    }
    
    override func backToPreviousState() {
        self.navigationController?.popViewController(animated: false)
    }
}

extension DetailCardVC: DetailCardViewProtocol {
    func onSuccessImageData(imageData: Data) {
        hideProgress()
        imgCard.image = UIImage(data: imageData, scale:1)
    }
}
