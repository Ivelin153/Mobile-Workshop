//
//  LoginModel.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 24.05.23.
//

import Foundation

struct LoginResponse: Codable {
    let jwt: String
    let user: User
}

struct User: Codable {
    let email: String
}

struct LoginRequest: Encodable {
    let identifier: String
    let password: String
}
