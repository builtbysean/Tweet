//
//  UserProfileView.swift
//  Tweet
//
//  Created by Sean Coffin on 10/4/25.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(AuthManager.self) private var authManager
    @Environment(UserManager.self) private var userManager
    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(userManager.currentUser?.username ?? "Loading")
                            
                        Text(userManager.currentUser?.email ?? "")
                            .foregroundStyle(.secondary)
                    }
                }
                
                Section {
                    Button("Sign Out") {
                        Task { await authManager.signOut() }
                    }
                    .foregroundStyle(.red)
                }
            }
            .navigationTitle("Profile")
        }
        .task { await userManager.fetchCurrentUser()}
    }
}

#Preview {
    UserProfileView()
}
