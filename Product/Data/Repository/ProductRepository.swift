//
//  ProductRepository.swift
//  Product
//
//  Created by Wai Thura Tun on 21/05/2024.
//

import Foundation

class ProductRepository {
    private let dataSource: ProductRemoteDataSource = .init()
    
    func getProducts(onSuccess: @escaping ([ProductVO]) -> (),
                     onFailed: @escaping (String) -> ()) {
        dataSource.getProducts(onSuccess: onSuccess, onFailed: onFailed)
    }
}
