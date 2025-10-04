//
//  AuthManager.swift
//  Tweet
//
//  Created by Sean Coffin on 10/3/25.
//
import Foundation
import Observation

@Observable
@MainActor
class AuthManager {
    private let authService: SupabaseAuthService
    
    var currentUser: User?
    
    init(authService: SupabaseAuthService = SupabaseAuthService()) {
        self.authService = authService
    }
    
    func signUp(email: String, password: String) async {
        do {
            self.currentUser = try await authService.signUp(email: email, password: password)
        } catch {
            print("DEBUG: Sign Up error: \(error.localizedDescription)")
        }
    }
    
    func signIn(email: String, password: String) async {
        do {
            self.currentUser = try await authService.signIn(email: email, password: password)
        } catch {
            print("DEBUG: Sign In error: \(error.localizedDescription)")
        }
    }
    
    func signOut() async {
        do {
           try await authService.signOut()
            currentUser = nil
        } catch {
            print("DEBUG: Sign out error: \(error.localizedDescription)")
        }
    }
    
    func refreshUser() async {
        do {
            self.currentUser = try await authService.getCurrentUser()
        } catch {
            print("DEBUG: Refresh user error: \(error)")
            currentUser = nil
            
        }
    }
}
