//
//  ContentView.swift
//  Tweet
//
//  Created by Sean Coffin on 10/3/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(AuthManager.self) private var authManager
    
    var body: some View {
        Group {
            if let currentUserID = authManager.currentUserID {
                UserProfileView()
            } else {
                LoginView()
            }
        }
        .task { await authManager.refreshUser() }
    }
}

#Preview {
    ContentView()
        .environment(AuthManager())
}
