//
//  ProductSearchVM.swift
//  Product
//
//  Created by Wai Thura Tun on 23/05/2024.
//

import Foundation

protocol ProductSearchViewDelegate {
    func onLoadProducts()
    func onError(error: String)
}

class ProductSearchVM {
    
    private let delegate: ProductSearchViewDelegate
    private let repository: ProductRepository = .init()
    
    init(delegate: ProductSearchViewDelegate) {
        self.delegate = delegate
    }
    
    private(set) var products: [ProductVO] = [] {
        didSet {
            self.delegate.onLoadProducts()
        }
    }
    
    private var searchInput: String?
    
    func setSearchInput(searchInput: String?) {
        self.searchInput = searchInput
    }
    
    func searchProduct() {
        repository.searchProduct(searchQuery: searchInput!) { [weak self] products in
            self?.products = products
        } onFailed: { [weak self] error in
            self?.delegate.onError(error: error)
        }

    }
}
