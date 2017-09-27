//
//  CoinHelper.swift
//  CoinFeed
//
//  Created by Logan O'Connell on 9/14/17.
//  Copyright © 2017 Logan O'Connell. All rights reserved.
//

import Foundation
import SwiftyJSON

class CoinHelper: NSObject {
    let downloadURL = "https://coinbin.org/"
    var coinsArr: Array <Dictionary <String, AnyObject>> = Array()
    
    override init() {
        super.init()
        
        parseJSONCoins(data: downloadCoins())
    }
    
    func getCoinsArr() -> Array <Dictionary <String, AnyObject>> {
        return self.coinsArr
    }
    
    func downloadCoinData(coin: String) -> Data {
        let url = URL(string: downloadURL + coin)!
        let jsonData = try! Data(contentsOf: url)
        
        return jsonData
    }
    
    func downloadCoins() -> Data {
        let url = URL(string: downloadURL + "coins")!
        let jsonData = try! Data(contentsOf: url)
        
        return jsonData
    }
    
    func parseJSONCoinData(key: String, json: JSON) -> Dictionary <String, AnyObject> {
        return json.dictionaryObject! as Dictionary<String, AnyObject>
    }
    
    func parseJSONCoins(data: Data) {
        let json = try! JSON(data: data)
        if let dict = json["coins"].dictionary {
            let newDict = dict.sorted { dict[$0.key]!["rank"].number!.intValue < dict[$1.key]!["rank"].number!.intValue }
            
            for coin in newDict {
                coinsArr.append(parseJSONCoinData(key: coin.key, json: coin.value))
            }
        }
    }
}
