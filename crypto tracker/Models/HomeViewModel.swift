//
//  HomeViewModel.swift
//  crypto tracker
//
//  Created by fcihpy on 2023/5/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    
    @MainActor
    func fetchCoinData() async {
//        allCoins.append(DeveloperPreview.instance.coin)
        portfolioCoins.append(DeveloperPreview.instance.coin)
        do {
            let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")!
            let (data, _) = try await URLSession.shared.data(from: url)
            allCoins = try JSONDecoder().decode([CoinModel].self, from: data)
        } catch (let error) {
            print(error)
        }
    }
}
