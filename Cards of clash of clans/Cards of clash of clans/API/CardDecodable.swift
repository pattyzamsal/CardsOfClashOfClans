//
//  CardDecodable.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/4/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import Foundation

class CardDecodable: Decodable {
    var _id: String
    var idName: String
    var rarity: String
    var type: String
    var name: String
    var description: String?
    var elixirCost: Int
    var copyId: Int
    var arena: Int
    var order: Int
    var __v: Int
    
    private enum CodingKeys: String, CodingKey {
        case _id
        case idName
        case rarity
        case type
        case name
        case description
        case elixirCost
        case copyId
        case arena
        case order
        case __v
    }
}
