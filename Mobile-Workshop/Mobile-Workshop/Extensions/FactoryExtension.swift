//
//  FactoryExtension.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 30.05.23.
//

import Factory

extension Container {
    var jwtStorage: Factory<JWTStorage> {
        self { JWTStorage.shared }
    }
    
    var networkManager: Factory<NetworkManager> {
        self { NetworkManager() }
            .singleton
    }
    
    var userRepository: Factory<UserRepository> {
        self { UserRepository() }
    }
}
