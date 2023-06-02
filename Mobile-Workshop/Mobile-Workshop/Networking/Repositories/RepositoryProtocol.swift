//
//  RepositoryProtocol.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 24.05.23.
//

import Foundation

protocol RepositoryProtocol {
    func login(request: LoginRequest) async throws -> LoginResponse
}
