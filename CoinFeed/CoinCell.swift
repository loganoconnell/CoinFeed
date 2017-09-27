//
//  CoinCell.swift
//  CoinFeed
//
//  Created by Logan O'Connell on 9/14/17.
//  Copyright © 2017 Logan O'Connell. All rights reserved.
//

import UIKit

// Four labels:
// Name (left top)          BTC Value (right top)
// Rank (left bottom)       USD Value (right bottom)


class CoinCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var btcPriceLabel: UILabel!
    @IBOutlet weak var usdPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.textColor = UIColor.vegaBlack
        rankLabel.textColor = UIColor.vegaGray
        btcPriceLabel.textColor = UIColor.vegaOrange
        usdPriceLabel.textColor = UIColor.vegaGreen
        layer.cornerRadius = 14
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.masksToBounds = false
    }
    
    func configureWith(_ coin: Coin) {
        nameLabel.text = coin.name
        rankLabel.text = String(format: "%d", coin.rank)
        btcPriceLabel.text = "BTC: " + "\(self.twoDigitsFormatted(coin.btcPrice))"
        usdPriceLabel.text = "USD: " + "\(self.twoDigitsFormatted(coin.usdPrice))"
    }
    
    private func twoDigitsFormatted(_ val: Double) -> String {
        return String(format: "%.0.2f", val)
    }
}
