//
//  WalletListRowView.swift
//  crypto tracker
//
//  Created by fcihpy on 2023/5/27.
//

import SwiftUI

struct WalletListRowView: View {
    @State var isSelect: Bool
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Text("Heco-1")
                    .bold()
                    .font(.system(size: 18))
                Text("0x3513...1ab2fd")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
            Spacer()
            Label("查看详情",systemImage: "arrow.right")
            Image(systemName: isSelect ? "checkmark" : "")
        }
        .padding(.vertical)
    }
}

struct WalletListRowView_Previews: PreviewProvider {
    static var previews: some View {
        WalletListRowView(isSelect: true)
    }
}
