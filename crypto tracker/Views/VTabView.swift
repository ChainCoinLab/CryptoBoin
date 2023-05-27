//
//  VTabView.swift
//  crypto tracker
//
//  Created by fcihpy on 2023/5/26.
//

import SwiftUI

struct VTabView: View {
    @State var selectIndex: Int = 0
    @State var colors: [Color] = [.red, .green, .blue]
    @State var selectColor: Color = .green
    var body: some View {
        TabView {
            sliderView()
                .tabItem {
                    Label("home", systemImage: "house")
                }
            Color.red
                .tabItem {
                    Label("Explore", systemImage: "person")
                }
            Color.orange
                .tabItem {
                    Label("number", systemImage: "1.circle.fill")
                }
        }
        .navigationTitle("demo")
        .navigationViewStyle(.stack)
    }
    
    func sliderView() -> some View {
        HStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 40) {
                    ForEach (0..<40) { i in
                        barItem(index: i)
                    }
                    Spacer()
                }
                .padding(.top, 40)
            }
            .frame(width: 49,height:300)
            
            ScrollView {
                List {
                    ForEach(0..<50) {_ in
                        Text("tttt")
                    }
                }
            }
            .background(colors[ selectIndex % colors.count])
        }
    }
    
    @ViewBuilder
    func barItem(index: Int) -> some View {
        var name: String = "BTC"
        var icon: String = "person"
        
        HStack {
            Image(systemName: icon)
                .onTapGesture {
                    selectIndex = index
                }
                .tag(index)
        }
        .background(.ultraThinMaterial)
        .tag(index)
        .frame(maxWidth: .infinity)
        .background(selectIndex == index ? colors[ index % colors.count] : Color.white)
    }
}

struct VTabView_Previews: PreviewProvider {
    static var previews: some View {
        VTabView()
    }
}

