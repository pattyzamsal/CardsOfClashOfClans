//
//  CardCell.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/2/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {

    @IBOutlet weak var lbCardName: UILabel!
    @IBOutlet weak var lbCardType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCardCell(name: String, type: String) {
        lbCardName.text = name
        lbCardType.text = type
    }
}
