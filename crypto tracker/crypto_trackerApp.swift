//
//  crypto_trackerApp.swift
//  crypto tracker
//
//  Created by fcihpy on 2023/5/25.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            print("app delegate")
            return true
        }
        
        func applicationDidEnterBackground(_ application: UIApplication) {
            print("app did enter background")
        }
        
        func applicationWillTerminate(_ application: UIApplication) {
            print("app will terminate")
        }
}

@main
struct crypto_trackerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
        
    
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
                    
                    WalletView(vm: vm)
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
