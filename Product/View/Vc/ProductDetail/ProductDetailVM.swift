//
//  ProductDetailVM.swift
//  Product
//
//  Created by Wai Thura Tun on 22/05/2024.
//

import Foundation

protocol ProductDetailViewDelegate {
    func onLoadProductDetail()
    func onError(error: String)
}

class ProductDetailVM {
    
    private let repository: ProductRepository = .init()
    private let delegate: ProductDetailViewDelegate
    
    init(delegate: ProductDetailViewDelegate) {
        self.delegate = delegate
    }
    
    private(set) var product: ProductVO? = nil {
        didSet {
            delegate.onLoadProductDetail()
        }
    }
    
    func getProductDetail(id: Int) {
        repository.getProductDetail(id: id) { [weak self] product in
            self?.product = product
        } onFailed: { [weak self] error in
            self?.delegate.onError(error: error)
        }

    }
}
