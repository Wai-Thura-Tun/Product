//
//  ProductResponse.swift
//  Product
//
//  Created by Wai Thura Tun on 21/05/2024.
//

import Foundation

struct ProductListResponse: Codable {
    let products: [ProductVO]
    let total: Int
    let skip: Int
    let limit: Int
    
    enum CodingKeys: String, CodingKey {
        case products, total, skip, limit
    }
}

struct ProductVO: Codable {
    let id: Int?
    let title: String?
    let description: String?
    let price: Double?
    let discountPercentage: Double?
    let rating: Double?
    let stock: Int?
    let brand: String?
    let category: String?
    let thumbnail: String?
    let images: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, price, discountPercentage, rating, stock, brand, category, thumbnail, images
    }
}

typealias ProductSearchResponse = ProductListResponse
