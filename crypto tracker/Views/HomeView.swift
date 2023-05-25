//
//  HomeView.swift
//  crypto tracker
//
//  Created by fcihpy on 2023/5/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var isShowPortf: Bool = false
    @ObservedObject var coins = CoinData()
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            VStack {
                homeHeader
                HStack {
                    Text("Coin")
                    Text("Holding")
                    Text("Price")
                }
                
                if !isShowPortf {
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if isShowPortf {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
//                Spacer()
            }
        }
    }
    
   
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(HomeViewModel())
                .navigationBarHidden(true)
        }
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: isShowPortf ? "plus" : "info")
                .animation(.none, value: 0)
                .background(
                    CircleButtonAnimationView(animate: $isShowPortf)
                )
            Spacer()
            Text(isShowPortf ? "Portfolio" : "Live Price")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: isShowPortf ? 180: 0))
                .onTapGesture {
                    withAnimation {
                        isShowPortf.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List{
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin,isShowHoldingColum: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
        .task {
            await vm.fetchCoinData()
        }
        .refreshable {
            await vm.fetchCoinData()
        }
    }
    
    private var portfolioCoinsList: some View {
        List{
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin,isShowHoldingColum: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
        .task {
            await vm.fetchCoinData()
        }
        .refreshable {
            await vm.fetchCoinData()
        }
    }
}

