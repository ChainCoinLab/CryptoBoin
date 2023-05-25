//
//  crypto_trackerApp.swift
//  crypto tracker
//
//  Created by fcihpy on 2023/5/25.
//

import SwiftUI

@main
struct crypto_trackerApp: App {
    @StateObject private var vm = HomeViewModel()
    @State private var isShowLauchView: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationView {
                    
                    HomeView()
                        .navigationBarHidden(true)
                }
                .environmentObject(vm)
                ZStack {
                    if isShowLauchView {
                        LaunchView(isShowLauchView: $isShowLauchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2)
            }
        }
    }
}
