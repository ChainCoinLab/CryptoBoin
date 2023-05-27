//
//  WalletListView.swift
//  crypto tracker
//
//  Created by fcihpy on 2023/5/27.
//

import SwiftUI

struct WalletListView: View {
    @Binding var isPresented: Bool
    @State private var selection: String?
    @State private var selectIndex = -1
    @State private var models:[String] = [
        "我的钱包1",
        "我的钱包2",
        "我的钱包3",
        "我的钱包4",
    ]
    
    var body: some View {
        NavigationView {
            
            VStack {
                List(0..<4) { index in
                    WalletListRowView(isSelect: selectIndex == index)
                        .background(self.selectIndex == index ? Color.red : Color.white)
                        .onTapGesture {
                            self.selectIndex = index
                        }
                    
                }
                
//                List() {
//                    ForEach (0..<4) { index in
//                        WalletListRowView(isSelect: selectIndex == index)
//
//                    }
//                    .onDelete(perform: delete)
//                    .onMove(perform: move)
//                    .listRowBackground(Color.green)
//                    .onTapGesture {
//                        self.selectIndex = index!
//                    }
//                }
//                .toolbar {
//                    EditButton()
//
//                }
                
                Button("+ 添加钱包") {
                    models.append("wallet")
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("我的钱包")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: leftBarItem())
        }
    }
    
    func delete(indexSet: IndexSet) {
        models.remove(atOffsets: indexSet)
    }
    
    func move(from source: IndexSet, destination: Int) {
        models.move(fromOffsets: source, toOffset: destination)
    }
    
    @ViewBuilder
    func leftBarItem() -> some View {
        Button {
            isPresented = false
        } label: {
            Image(systemName: "xmark")
        }
    }
}

struct WalletListView_Previews: PreviewProvider {
    static var previews: some View {
        WalletListView(isPresented: .constant(true))
    }
}
