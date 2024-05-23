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
        dataSource.getProducts(
            onSuccess: onSuccess,
            onFailed: onFailed)
    }
    
    func getProductDetail(id: Int, 
                          onSuccess: @escaping (ProductVO) -> (),
                          onFailed: @escaping (String) -> ()) {
        dataSource.getProductDetail(id: id, 
                                    onSuccess: onSuccess,
                                    onFailed: onFailed)
    }
    
    func searchProduct(searchQuery: String, 
                       onSuccess: @escaping ([ProductVO]) -> (),
                       onFailed: @escaping (String) -> ()) {
        dataSource.searchProduct(searchQuery: searchQuery, 
                                 onSuccess: onSuccess,
                                 onFailed: onFailed)
    }
}
