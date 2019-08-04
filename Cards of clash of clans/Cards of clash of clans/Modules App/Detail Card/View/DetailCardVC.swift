//
//  DetailCardVC.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/3/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import UIKit

class DetailCardVC: UIViewController {

    @IBOutlet weak var imgCard: UIImageView!
    @IBOutlet weak var lbDescriptionCard: UILabel!
    
    var specificCard: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem?.title = ""
        self.navigationItem.title = specificCard
    }
}
