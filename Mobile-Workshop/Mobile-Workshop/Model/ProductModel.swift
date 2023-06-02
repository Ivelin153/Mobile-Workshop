//
//  ProductModel.swift
//  Mobile-Workshop
//
//  Created by iOS Dev on 1.06.23.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let shortDescription: String
    let stock: Int
    let price: Int
    let rating: Int
    let image: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case shortDescription = "short_description"
        case stock
        case price
        case rating
        case image
        case category
        
    }
}
