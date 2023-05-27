//
//  MineView.swift
//  crypto tracker
//
//  Created by fcihpy on 2023/5/27.
//

import SwiftUI

struct MineView: View {
    @State private var models:[[String]] = [
        [
            "消息",
            "助记词",
            "地址本",
            "云钱包",
            "安全与隐私",
        ],
       [
        "Bit合约",
        "BTSB",
       ],
        [
            "钱包学院",
            "帮助中心",
        ],
       [
        "招募代理",
         "工作机会"
       ]
        
        
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach (models, id: \.self) { model in
                        Section("aa") {
                            ForEach (model, id: \.self) { item in
                                Text(item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("发现")
        }
    }
}


struct MineView_Previews: PreviewProvider {
    static var previews: some View {
        MineView()
    }
}
