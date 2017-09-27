//
//  FeedViewController.swift
//  CoinFeed
//
//  Created by Logan O'Connell on 9/14/17.
//  Copyright © 2017 Logan O'Connell. All rights reserved.
//

import UIKit
import VegaScrollFlowLayout

class FeedViewController: UIViewController {
    @IBOutlet weak var coinFeed: UICollectionView!
    
    private let itemHeight: CGFloat = 84
    private let lineSpacing: CGFloat = 20
    private let xInset: CGFloat = 20
    private let topInset: CGFloat = 10
    
    var coins: Array <Coin> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let nib = UINib(nibName: "CoinCell", bundle: nil)
        coinFeed.register(nib, forCellWithReuseIdentifier: "CoinCell")
        coinFeed.contentInset.bottom = itemHeight
        
        configureCollectionViewLayout()
        configureNavigationBar()
        
        let coinsArr = CoinHelper().getCoinsArr()
        
        for coinArr in coinsArr {
            self.coins.append(Coin(name: coinArr["name"] as! String, rank: coinArr["rank"] as! Int, btcPrice: coinArr["btc"] as! Double, usdPrice: coinArr["usd"] as! Double))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func configureCollectionViewLayout() {
        guard let layout = coinFeed.collectionViewLayout as? VegaScrollFlowLayout else { return }
        layout.minimumLineSpacing = lineSpacing
        layout.sectionInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
        let itemWidth = UIScreen.main.bounds.width - 2 * xInset
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        coinFeed.collectionViewLayout.invalidateLayout()
    }
    
    private func configureNavigationBar() {
        self.navigationItem.title = "CoinFeed"
        self.navigationController?.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
}

extension FeedViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoinCell", for: indexPath) as! CoinCell
        cell.configureWith(self.coins[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coins.count
    }
}
