//
//  TabBarView.swift
//  crypto tracker
//
//  Created by fcihpy on 2023/5/26.
//

import SwiftUI

struct TabBarView: View {
    @State private var color: Color = .teal
    @State private var selectedX: CGFloat = 0
    @State private var selectedTab: Tab = .wallet
    @State private var x: [CGFloat] = [0,0,0,0]
    
    var body: some View {
        GeometryReader { proxy in
            let hasHomeIndicator = proxy.safeAreaInsets.bottom > 0
            HStack {
                content
            }
            .padding(.bottom, hasHomeIndicator ? 16 : 0)
            .frame(maxWidth: .infinity, maxHeight: hasHomeIndicator ? 88 : 49)
            .background(.ultraThinMaterial)
            .background(
                Circle()
                    .fill(color)
                    .offset(x: selectedX, y: -10)
                    .frame(width: 88)
                    .frame(maxWidth: .infinity, alignment: .leading)
            )
            .overlay(
                Rectangle()
                    .frame(width: 28, height: 5)
                    .cornerRadius(3)
                    .frame(width: 88)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .offset(x: selectedX)
                    .blendMode(.overlay)
            )
            .backgroundStyle(cornerRadius: hasHomeIndicator ? 0 : 0)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .offset(y: 0)
            .accessibility(hidden: false)
            
        }
    }
    
    var content: some View {
        ForEach(tabBarModels ) { item in
            if item.id == 0 { Spacer() }
            Button {
                selectedTab = item.selectedTab
                withAnimation {
                    selectedX = x[item.id]
                    color = item.color
                }
            } label: {
                VStack {
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .font(.system(size: 17, weight: .bold))
                        .frame(width: 44, height: 29)
                    Text(item.name)
                        .frame(width: 88)
                        .lineLimit(1)
                }
                .overlay(
                    GeometryReader { proxy in
                        let offset = proxy.frame(in: .global).minX
                        Color
                            .clear
                            .preference(key: TabPreferenceKey.self, value: offset)
                            .onPreferenceChange(TabPreferenceKey.self) { value in
                                x[item.id] = value
                                if selectedTab == item.selectedTab {
                                    selectedX = x[item.id]
                                }
                            }
                    }
                )
            }
            .frame(width: 44)
            .foregroundColor(selectedTab == item.selectedTab ? .primary :  .secondary)
            .blendMode(selectedTab == item.selectedTab ? .overlay : .normal)
            Spacer()
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
