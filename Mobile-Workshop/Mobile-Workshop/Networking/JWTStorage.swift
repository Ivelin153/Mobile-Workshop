//
//  JWTStorage.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 30.05.23.
//

import Foundation

class JWTStorage {
    static let shared = JWTStorage() // Singleton instance
    
    var jwtToken: String?
    
    private init() {}
}
