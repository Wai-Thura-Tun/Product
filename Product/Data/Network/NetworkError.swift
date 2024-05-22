//
//  NetworkError.swift
//  Product
//
//  Created by Wai Thura Tun on 21/05/2024.
//

import Foundation

enum NetworkError: Error {
    case INVALID_URL
    case UNKNOWN
    case EMPTY_RESPONSE
    case DECODE_ERROR
    case UNEXPECTED_STATUS_CODE(Int)
    
    var customMessage: String {
        switch self {
        case .INVALID_URL:
            return ""
        case .UNKNOWN:
            return ""
        case .EMPTY_RESPONSE:
            return ""
        case .DECODE_ERROR:
            return ""
        case .UNEXPECTED_STATUS_CODE:
            return ""
        }
    }
}
