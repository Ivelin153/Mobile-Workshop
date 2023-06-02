//
//  ProductDetailViewModel.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 1.06.23.
//

import SwiftUI
import Factory

class ProductDetailViewModel: ObservableObject {
    @Published var product: Product?
    
    private let repository: ProductRepositoryProtocol
    
    init(repository: ProductRepositoryProtocol = ProductRepository()){
        self.repository = repository
    }
    
    func fetchProductDetails(){
        Task{
            do {
                product = try await repository.fetchProductDetails(id: 7)
            } catch {
                print("Error fetching product details: \(error)")
            }
        }
    }
    
}
