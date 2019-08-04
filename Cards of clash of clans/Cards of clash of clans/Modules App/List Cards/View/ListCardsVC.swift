//
//  ListCardsVC.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/2/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import UIKit

class ListCardsVC: UIViewController {

    @IBOutlet weak var tvListCards: UITableView!
    
    private var listOfCards: [(name: String, type: String)] = [("Arrows", "Spell"), ("Bomber", "Troop"), ("Archers", "Troop")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "List of cards"
        self.navigationItem.backBarButtonItem?.title = ""
        
        tvListCards.delegate = self
        tvListCards.dataSource = self
        tvListCards.separatorStyle = .none
        let nib = UINib(nibName: "CardCell", bundle: nil)
        tvListCards.register(nib, forCellReuseIdentifier: "cardCell")
        
        orderCards()
    }

    private func orderCards() {
        listOfCards = listOfCards.sorted(by: { $0.name < $1.name })
        tvListCards.reloadData()
    }
}

extension ListCardsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvListCards.dequeueReusableCell(withIdentifier: "cardCell") as! CardCell
        
        if !listOfCards.isEmpty {
            cell.setCardCell(name: listOfCards[indexPath.row].name, type: listOfCards[indexPath.row].type)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailCardVC = DetailCardVC()
        detailCardVC.specificCard = listOfCards[indexPath.row].name
        self.navigationController?.pushViewController(detailCardVC, animated: false)
    }
}
