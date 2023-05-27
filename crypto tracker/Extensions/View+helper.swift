//
//  View+helper.swift
//  crypto tracker
//
//  Created by fcihpy on 2023/5/26.
//

import SwiftUI


extension View {
    func hideKeybord() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
