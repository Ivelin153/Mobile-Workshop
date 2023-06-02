//
//  JWTInterceptor.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 30.05.23.
//

import Foundation
import SwiftUI
import Alamofire
import Factory


class JWTInterceptor: RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        var adaptedRequest = urlRequest
        if let token = JWTStorage.shared.jwtToken {
         adaptedRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
            completion(.success(adaptedRequest))
        
    }
}
