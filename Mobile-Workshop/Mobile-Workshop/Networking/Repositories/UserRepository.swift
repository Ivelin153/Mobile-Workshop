//
//  UserRepository.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 30.05.23.
//

import Foundation
import Factory
import Alamofire

class UserRepository: RepositoryProtocol {
      
    private let networkManager = Container.shared.networkManager()
    
    func login(request: LoginRequest) async throws -> LoginResponse {
        let url = "https://ethereal-artefacts.fly.dev/api/auth/local"
        return try await networkManager.request(url, method: .post, parameters: request)
        
    }
}
