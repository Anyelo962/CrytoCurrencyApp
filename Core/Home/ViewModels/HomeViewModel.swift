//
//  HomeViewModel.swift
//  CrytoCurrencyApp
//
//  Created by Anyelo Vinzen on 25/5/23.
//

import SwiftUI

class HomeViewModel : ObservableObject{
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    
    init(){
        
        fetchCoinData()
    }
    
    func fetchCoinData(){
        
        let urlString: String = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en"
        
        
        guard let url = URL(string: urlString) else {return }
        
        URLSession.shared.dataTask(with:url){ data, response, error in
            if let error = error{
                return
            }
            
//            if let response = response as? HTTPURLResponse {
//                print("DEBUG: response code \(response.statusCode)")
//            }
            
            guard let data = data else { return }
            
            do{
                
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoin()
                }
            
            } catch let error{
                print("Error \(error)")
            }
        }.resume()
    }
    
    func configureTopMovingCoin(){
        let topMover = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
        self.topMovingCoins = Array(topMover.prefix(5))
    }
}

