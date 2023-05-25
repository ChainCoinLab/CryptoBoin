//
//  ContentView.swift
//  crypto tracker
//
//  Created by fcihpy on 2023/5/25.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        VStack {
            Text("最好的钱包")
                .foregroundColor(Color.theme.green)
            Text("最好的钱包")
                .foregroundColor(Color.theme.secondaryText)
            Text("最好的钱包")
                .foregroundColor(Color.theme.red)
            Text("最好的钱包")
                .foregroundColor(Color.theme.accent)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
