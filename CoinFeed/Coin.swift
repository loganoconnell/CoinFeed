//
//  Coin.swift
//  CoinFeed
//
//  Created by Logan O'Connell on 9/14/17.
//  Copyright © 2017 Logan O'Connell. All rights reserved.
//

import Foundation

public struct Coin {
    let name: String
    let rank: Int
    let btcPrice: Double
    let usdPrice: Double
    
    init(name: String, rank: Int, btcPrice: Double, usdPrice: Double) {
        self.name = name
        self.rank = rank
        self.btcPrice = btcPrice
        self.usdPrice = usdPrice
    }
}
