//
//  UserManager.swift
//  Tweet
//
//  Created by Sean Coffin on 10/4/25.
//

import Foundation

@Observable
@MainActor
class UserManager {
    var currentUser: User?
    
    private let service: UserService
    
    init(service: UserService = UserService()) {
        self.service = service
    }
    
    func fetchCurrentUser() async {
        do {
            self.currentUser = try await service.fetchCurrentUser()
        } catch {
            print("DEBUG: Failed to fetch current user: \(error)")
        }
    }
}
