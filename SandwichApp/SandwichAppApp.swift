//
//  SandwichAppApp.swift
//  SandwichApp
//
//  Created by Tia Lendor on 5/30/23.
//

import SwiftUI

@main
struct SandwichAppApp: App {
    @StateObject private var store = SandwichStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
