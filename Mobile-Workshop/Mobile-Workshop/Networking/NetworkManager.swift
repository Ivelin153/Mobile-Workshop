//
//  NetworkManager.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 24.05.23.
//

import Foundation
import Alamofire
import Factory

class NetworkManager {
    private let session: Session
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        self.session = Session(configuration: configuration, interceptor: JWTInterceptor())
    }
    
    func request<T: Decodable>(_ url: String, method: HTTPMethod = .get, parameters: LoginRequest? = nil) async throws -> T {
            try await withCheckedThrowingContinuation { continuation in
                session.request(url, method: method, parameters: parameters)
                    .validate(statusCode: 200..<600)
                    .responseDecodable(of: T.self) { response in
                        switch response.result {
                        case .success(let data):
                            continuation.resume(returning: data)
                        case .failure(let error):
                            continuation.resume(throwing: error)
                        }
                    }
            }
        }
}
