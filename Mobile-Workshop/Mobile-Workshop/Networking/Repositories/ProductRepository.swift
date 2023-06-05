//
//  ProductRepository.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 1.06.23.
//

import Foundation
import Factory
import Alamofire

class ProductRepository: ProductRepositoryProtocol {
    private let networkManager = Container.shared.networkManager()
 
    func fetchProductDetails(id: Int) async throws -> Product {
        let url = "https://ethereal-artefacts.fly.dev/api/products/\(id)?populate=*"
        return try await networkManager.request(url, method: .get)
    }
}
