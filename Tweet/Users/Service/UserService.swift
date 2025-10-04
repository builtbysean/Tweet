//
//  UserService.swift
//  Tweet
//
//  Created by Sean Coffin on 10/4/25.
//

import Foundation
import Supabase

struct UserService {
    private let client: SupabaseClient
    
    init() {
        self.client = SupabaseClient.init(
            supabaseURL: URL(string: Constants.projectURLString)!,
            supabaseKey: Constants.projectAPIKey
        )
    }
    
    func fetchCurrentUser() async throws -> User {
        let user = try await client.auth.session.user
        
        return try await client.from("users")
            .select()
            .eq("id", value: user.id.uuidString)
            .single()
            .execute()
            .value
    }
    
}
