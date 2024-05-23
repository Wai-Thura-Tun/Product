//
//  ProductSearchRequest.swift
//  Product
//
//  Created by Wai Thura Tun on 23/05/2024.
//

import Foundation

struct ProductSearchRequest: Encodable {
    let search: String?
    
    enum CodingKeys: String, CodingKey {
        case search = "q"
    }
}
