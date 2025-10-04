//
//  TweetApp.swift
//  Tweet
//
//  Created by Sean Coffin on 10/3/25.
//
import SwiftUI

@main
struct TweetApp: App {
    @State private var authManager = AuthManager()
    @State private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(authManager)
                .environment(userManager)
        }
    }
}
