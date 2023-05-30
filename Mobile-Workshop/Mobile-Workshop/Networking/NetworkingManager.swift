//
//  NetworkingManager.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 24.05.23.
//

import Foundation
import Alamofire

class NetworkManager {
    private let session: Session
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        
        self.session = Session(configuration: configuration)
    }
    
    func request<T: Decodable>(_ url: String, method: HTTPMethod = .post, parameters: [String: Any]? = nil) async throws -> T {
        try await withCheckedThrowingContinuation { continuation in
            session.request(url, method: method, parameters: parameters)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let data):
                        print(data)
                        continuation.resume(returning: data)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
}
