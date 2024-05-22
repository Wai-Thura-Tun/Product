//
//  ProductRequestInterceptor.swift
//  Product
//
//  Created by Wai Thura Tun on 21/05/2024.
//

import Foundation
import Alamofire

class ProductRequestInterceptor: RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        var request = urlRequest
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMWFkMmI5ZTg5ZWZlNGEwYjk0OTgyNzVkNjhlYmRjMGMiLCJ1c2VybmFtZSI6InR0MiIsImV4cCI6MTcxNjM4OTQxN30.UFxmZD5M4sbWJwuPO0pk_ueYUcwAhV0yCrQ5cULAk30"
        request.headers.add(.authorization(token))
        completion(.success(request))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: any Error, completion: @escaping (RetryResult) -> Void) {
        if request.response?.statusCode == 401 {
            NotificationCenter.default.post(name: .TokenExpiredNotification, object: nil)
        }
        completion(.doNotRetry)
    }
}
