//
//  User.swift
//  Tweet
//
//  Created by Sean Coffin on 10/3/25.
//
import Foundation

struct User: Identifiable, Codable {
    let id: String
    let email: String
    let username: String
    let createdAt: Date
    let profileImageURL: String? = nil 
}
