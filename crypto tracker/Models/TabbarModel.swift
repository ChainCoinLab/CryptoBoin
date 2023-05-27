//
//  TabbarModel.swift
//  crypto tracker
//
//  Created by fcihpy on 2023/5/26.
//

import SwiftUI

struct TabbarModel: Identifiable {
    var id: Int
    var name: String
    var icon: String
    var color: Color
    var selectedTab: Tab
}

enum Tab: String {
    case wallet
    case asset
    case trade
    case mine
}


var tabBarModels = [
    TabbarModel(id: 0,name: "Learn Now", icon: "house", color: .teal, selectedTab: .wallet),
    TabbarModel(id: 1,name: "Explore", icon: "magnifyingglass", color: .blue, selectedTab: .asset),
    TabbarModel(id: 2,name: "Notifications", icon: "bell", color: .red, selectedTab: .trade),
    TabbarModel(id: 3,name: "Library", icon: "rectangle.stack", color: .orange, selectedTab: .mine)
]
