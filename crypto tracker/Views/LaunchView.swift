//
//  LaunchView.swift
//  crypto tracker
//
//  Created by fcihpy on 2023/5/25.
//

import SwiftUI

struct LaunchView: View {
    @State private var loadText: [String] = "发现优质资产，尽在饕餮钱包...".map { String($0) }
    @State private var isShowLoadingText: Bool = false
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @Binding var isShowLauchView: Bool
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
            Image("logo-transparent")
                .resizable()
                .frame(width: 100,height: 100)
            ZStack {
                if isShowLoadingText {
                    HStack(spacing: 0) {
                        ForEach (loadText.indices) { index in
                            Text(loadText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.white)
                                .offset(y:  counter == index ? -5 : 0)
                        }
                        .transition(AnyTransition.scale.animation(.easeIn))
                    }
                }
            }
            .offset(y: 70)
        }
        .onAppear {
            isShowLoadingText.toggle()
        }
        .onReceive(timer) { _ in
            withAnimation {
                let lastIndex = loadText.count - 1
                if counter == lastIndex {
                    counter = 0
                    loops += 1
                    if loops >= 2 {
                        isShowLauchView = false
                    }
                } else {
                    counter += 1
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(isShowLauchView: .constant(true))
    }
}
