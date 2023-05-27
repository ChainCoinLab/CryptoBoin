//
//  WalletView.swift
//  crypto tracker
//
//  Created by fcihpy on 2023/5/27.
//

import SwiftUI
import UIKit

struct Button1Model: Identifiable,Hashable {
    var id = UUID().uuidString
    var icon: String
    var text: String
    
    
}
struct WalletView: View {
    var models = [
        Button1Model(icon: "qrcode", text: "扫码"),
        Button1Model(icon: "barcode.viewfinder", text: "收款"),
        Button1Model(icon: "paperplane.fill", text: "转账"),
        Button1Model(icon: "arrow.left.arrow.right", text: "兑换")
    ]
    @State private var isSecurty: Bool = false
    @State private var isCopy: Bool = false
    @ObservedObject  var vm: HomeViewModel
    @State private var isShowNetworkSheet: Bool = false
    @State private var isShowWalletSheet: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.orange)
                    .ignoresSafeArea()
                VStack(alignment: .leading,spacing: 20) {
                    addressView()
                    balanceView()
                    buttonView()
                    pageBarView()
                    
                    listView()
                }
//                .padding(.horizontal)
                
            }
            .navigationBarItems(leading: leftNavItem(), trailing: rightNavItem())
        }
    }
    
    @ViewBuilder
    func leftNavItem() -> some View {
        Button("我的钱包") {
            isShowWalletSheet.toggle()
        }
        .sheet(isPresented: $isShowWalletSheet) {
           WalletListView(isPresented: $isShowWalletSheet)
        }
    }
    
    @ViewBuilder
    func rightNavItem() -> some View {
        Button {
            isShowNetworkSheet = true
        }label: {
            HStack(alignment: .top) {
                Image(systemName: "list.bullet.rectangle.fill")
                Text("全部网络")
                Image(systemName: "arrow.down")
            }
            
        }
        .sheet(isPresented: $isShowNetworkSheet) {
            Text("sheet")
        }
    }
    
    func sectionView() -> some View {
        HStack {
            HStack {
                Text("代币")
                Text("藏品")
                Text("工具")
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "checkmark.seal")
                }
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
            .padding()
            
        }
    }
    
    func pageBarView() -> some View {
        HStack {
            Button("代币") {
                
            }
            Button("藏品") {
                
            }
            Button("工具") {
                
            }
        }
    }
    
    func addressView() -> some View {
        HStack(spacing: 20) {
            HStack {
                Text("0x59e..D70E5d")
                    .font(.system(size: 15))
                    .foregroundColor(.secondary)
                Image(systemName: "doc.on.doc")
            }
            .onTapGesture {
                UIPasteboard.general.string = "Hello world"
                isCopy.toggle()
            }

            Label("179.95", systemImage: "g.square")
                .onTapGesture {
                    let aa = UIPasteboard.general.string
                    print(aa ?? "")
                }
            

        }
    }
    
    func balanceView() -> some View {
        HStack(alignment: .top, spacing: 10) {
            Text(isSecurty ? "**** " : "$ 0.00")
                .font(.largeTitle)
                .bold()
            Image(systemName: isSecurty ? "eye.slash": "eye.fill" )
        }
        .onTapGesture {
            isSecurty.toggle()
        }
    }
    
    func buttonView() -> some View {
        HStack() {
            ForEach (models, id: \.self) { item in
                Button1(icon: item.icon, text: item.text)
                Spacer()
            }
            
        }
        .padding(.top)
    }
    
    func listView() -> some View {
        Group {
            List {
//                addressView()
//
//                balanceView()
//                buttonView()
//
//                pageBarView()
                
                Section(header: Text("aaa")) {
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

                }
    //                        .listStyle(.insetGrouped)
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

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView(vm: HomeViewModel())
    }
}
