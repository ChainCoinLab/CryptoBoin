//
//  Button1.swift
//  crypto tracker
//
//  Created by fcihpy on 2023/5/27.
//

import SwiftUI

struct Button1: View {
    @State var icon: String = ""
    @State var text: String = ""
    var body: some View {
        Button {
            
        } label: {
            VStack {
                Image(systemName: icon)
                    .foregroundColor(.purple)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.black.opacity(0.1), lineWidth: 1)
                            .frame(width: 60, height: 30)
                    )
                Text(text)
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 60, height: 49)
    }
}

struct Button1_Previews: PreviewProvider {
    static var previews: some View {
        Button1()
    }
}
