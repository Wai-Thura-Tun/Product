//
//  ProductRemoteRepository.swift
//  Product
//
//  Created by Wai Thura Tun on 21/05/2024.
//

import Foundation

class ProductRemoteDataSource {
    private let network: NetworkManager = .shared
    
    func getProducts(onSuccess: @escaping ([ProductVO]) -> (),
                     onFailed: @escaping (String) -> ()) {
        network.request(endPoint: .GetProducts) { (response: ProductResponse) in
            onSuccess(response.products)
        } onFailed: { error in
            onFailed(error.customMessage)
        }
    }
}
