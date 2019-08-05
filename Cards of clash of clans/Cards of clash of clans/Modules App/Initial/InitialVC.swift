//
//  InitialVC.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/1/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import UIKit

class InitialVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = TextsApps.titleInitial.rawValue
    }

    @IBAction func onStart(_ sender: Any) {
        self.navigationController?.pushViewController(ListCardsVC(), animated: false)
    }
    
}

