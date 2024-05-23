//
//  EndPoint.swift
//  Product
//
//  Created by Wai Thura Tun on 21/05/2024.
//

import Foundation
import Alamofire

enum ProductEndPoint: EndPoint {
    case GetProducts
    case GetProductDetail(Int)
    case SearchProduct(Encodable)
    
    var path: String {
        switch self {
        case .GetProducts:
            return "/products"
        case .GetProductDetail(let code):
            return "/products/\(code)"
        case .SearchProduct:
            return "/products/search"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .GetProducts, .GetProductDetail, .SearchProduct:
            return .get
        }
    }
    
    var header: Alamofire.HTTPHeaders? {
        switch self {
        case .GetProducts, .GetProductDetail, .SearchProduct:
            return nil
        }
    }
    
    var parameter: Alamofire.Parameters? {
        switch self {
        case .GetProducts, .GetProductDetail:
            return nil
        case .SearchProduct(let parameter):
            return parameter.toDict()
        }
    }
    
    var encoding: any Alamofire.ParameterEncoding {
        switch self {
        case .GetProducts, .GetProductDetail, .SearchProduct:
            return URLEncoding.default
        }
    }
}
