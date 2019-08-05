//
//  ListCardsVC.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/2/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import UIKit

class ListCardsVC: BaseVC {

    @IBOutlet weak var tvListCards: UITableView!
    
    private lazy var presenter = ListCardsModel(view: self)
    
    private var listOfCards = [CardDecodable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = TextsApps.listCards.rawValue
        self.navigationItem.backBarButtonItem?.title = ""
        
        tvListCards.delegate = self
        tvListCards.dataSource = self
        tvListCards.separatorStyle = .none
        let nib = UINib(nibName: TextsApps.cardCell.rawValue, bundle: nil)
        tvListCards.register(nib, forCellReuseIdentifier: TextsApps.identifierCardCell.rawValue)
        
        showProgress()
        presenter.obtainAllCards()
    }

    private func orderCards() {
        listOfCards = listOfCards.sorted(by: { $0.name < $1.name })
        tvListCards.reloadData()
    }
    
    override func backToPreviousState() {
        self.navigationController?.popViewController(animated: false)
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
        let cell = tvListCards.dequeueReusableCell(withIdentifier: TextsApps.identifierCardCell.rawValue) as! CardCell
        
        if !listOfCards.isEmpty {
            cell.setCardCell(name: listOfCards[indexPath.row].name, type: listOfCards[indexPath.row].type)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailCardVC = DetailCardVC()
        detailCardVC.specificCard = listOfCards[indexPath.row]
        self.navigationController?.pushViewController(detailCardVC, animated: false)
    }
}

extension ListCardsVC: ListCardsViewProtocol {
    func onSuccessListCards(cards: [CardDecodable]) {
        hideProgress()
        listOfCards = cards
        orderCards()
    }
}
