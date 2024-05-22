//
//  NetworkManager.swift
//  Product
//
//  Created by Wai Thura Tun on 21/05/2024.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared: NetworkManager = .init()
    private let session: Session
    private let tokenExpiredErrorCode: Int = 401
    
    private init() {
        session = Session()
    }
    
    func request<T: Codable>(endPoint: ProductEndPoint,
                             onSuccess: @escaping (T) -> (),
                             onFailed: @escaping (NetworkError) -> ()) {
        session.request(endPoint, method: endPoint.method, parameters: endPoint.parameter, encoding: endPoint.encoding, headers: endPoint.header)
            .validate({ [weak self] request, response, data in
                if response.statusCode == self?.tokenExpiredErrorCode {
                    return .failure(NetworkError.UNEXPECTED_STATUS_CODE(response.statusCode))
                }
                else {
                    return .success(())
                }
            })
            .response { afResponse in
                if let statusCode = afResponse.response?.statusCode {
                    if (200..<300) ~= statusCode {
                        if let data = afResponse.data {
                            let object = try? JSONDecoder().decode(T.self, from: data)
                            if let object = object {
                                onSuccess(object)
                            }
                            else {
                                onFailed(.DECODE_ERROR)
                            }
                        }
                        else {
                            onFailed(.EMPTY_RESPONSE)
                        }
                    }
                    else {
                        onFailed(.UNEXPECTED_STATUS_CODE(statusCode))
                    }
                }
                else {
                    onFailed(.EMPTY_RESPONSE)
                }
        }
    }
}
