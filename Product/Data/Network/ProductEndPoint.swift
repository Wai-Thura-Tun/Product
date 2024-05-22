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
    
    var path: String {
        switch self {
        case .GetProducts:
            return "/products"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .GetProducts:
            return .get
        }
    }
    
    var header: Alamofire.HTTPHeaders? {
        switch self {
        case .GetProducts:
            return nil
        }
    }
    
    var parameter: Alamofire.Parameters? {
        switch self {
        case .GetProducts:
            return nil
        }
    }
    
    var encoding: any Alamofire.ParameterEncoding {
        switch self {
        case .GetProducts:
            return URLEncoding.default
        }
    }
}
