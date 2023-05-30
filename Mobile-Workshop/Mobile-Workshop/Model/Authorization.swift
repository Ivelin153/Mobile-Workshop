//
//  Authorization.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 24.05.23.
//

import Foundation

struct Authorization: Codable {
    let jwt: String
    let user: User
}

struct User: Codable {
    let id: Int
    let username: String
    let email: String
    let provider: String
    let confirmend: Bool
    let blocked: Bool
}
