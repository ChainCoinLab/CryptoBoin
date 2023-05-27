//
//  Coin.swift
//  crypto tracker
//
//  Created by fcihpy on 2023/5/25.
//

import SwiftUI

struct Coin: Identifiable,Decodable {
    var id: Int
    var coin_name: String
    var acronym: String
    var logo: String
}


class CoinList: ObservableObject {
    @Published var items: [Coin] = []
    
    @MainActor
    func fetchData() async {
        do {
            let url = URL(string: "https://random-data-api.com/api/crypto_coin/random_crypto_coin?size=10")!
            let (data, _) = try await URLSession.shared.data(from: url)
            items = try JSONDecoder().decode([Coin].self, from: data)
        } catch {
            print("Error")
        }
    }
}
