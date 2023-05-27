//
//  CoinListView.swift
//  crypto tracker
//
//  Created by fcihpy on 2023/5/25.
//

import SwiftUI

struct CoinListView: View {
    @ObservedObject private var vm = HomeViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.coinList) { coin in
                    HStack {
                        AsyncImage(url: URL(string: coin.logo)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 32, height: 32)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(coin.coin_name)
                            Text(coin.acronym)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }

                }
                .listStyle(.insetGrouped)
            }
            .listStyle(.insetGrouped)
            .task {
                await vm.fetchCoinList()
            }
            .refreshable {
                await vm.fetchCoinList()
            }
            .navigationTitle("coin data")
        }
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}

