//
//  BettermentApp.swift
//  Betterment
//
//  Created by Carson Clark on 2024-05-13.
//

import SwiftUI
import FirebaseCore

@main
struct BettermentApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
