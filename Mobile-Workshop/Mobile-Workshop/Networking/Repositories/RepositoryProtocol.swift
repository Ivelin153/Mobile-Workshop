//
//  RepositoryProtocol.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 24.05.23.
//

import Foundation


protocol RepositoryProtocol {
    func authorize() async throws -> Authorization
}
