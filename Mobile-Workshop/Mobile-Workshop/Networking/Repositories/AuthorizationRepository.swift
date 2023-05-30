//
//  AuthorizationRepository.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 24.05.23.
//

import Foundation
import Alamofire

class AuthorizationRepository: RepositoryProtocol {
    private let networkManger = NetworkManager()
    
    func authorize() async throws -> Authorization {
        let url = "https://ethereal-artefacts.fly.dev/api/auth/local"
        
        let parameters: Parameters = [
            "identifier": "test@test.com",
            "password": "test123"
        ]
        
        return try await networkManger.request(url, method: .post, parameters: parameters);
    }
}
