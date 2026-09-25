//
//  TrailMateApp.swift
//  TrailMate
//
//  Created by SUPER CHARGE on 25/09/26.
//
import SwiftUI

@main
struct TrailMateApp: App {
    @State private var store = TrailStore()
    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environment(store)
        }
    }
}
