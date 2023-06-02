//
//  ProductRepositoryProtocol.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 1.06.23.
//

import Foundation

protocol ProductRepositoryProtocol {
    func fetchProductDetails(id: Int) async throws -> Product
}
