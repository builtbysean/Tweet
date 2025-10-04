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
            if let currentUser = authManager.currentUser {
                VStack {
                    Text(currentUser.email)
                        .padding()
                    
                    Button { Task { await authManager.signOut()} } label: {
                        Text("Sign Out")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 352, height: 44)
                            .background(Color(.systemBlue))
                            .cornerRadius(8)
                    }
                }
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
