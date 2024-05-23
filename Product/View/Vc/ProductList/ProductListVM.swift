//
//  ProductListVM.swift
//  Product
//
//  Created by Wai Thura Tun on 21/05/2024.
//

import Foundation

protocol ProductListViewDelegate {
    func onLoadProducts()
    func onError(error: String)
}

class ProductListVM {
    private let repository: ProductRepository = .init()
    
    private let delegate: ProductListViewDelegate
    
    init(delegate: ProductListViewDelegate) {
        self.delegate = delegate
    }
    
    private(set) var products: [ProductVO] = [] {
        didSet {
            delegate.onLoadProducts()
        }
    }
    
    func getBooks() {
        repository.getProducts { [weak self] products in
            self?.products = products
        } onFailed: { [weak self] error in
            self?.delegate.onError(error: error)
        }
    }
    
}
