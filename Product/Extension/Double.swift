//
//  Double.swift
//  Product
//
//  Created by Wai Thura Tun on 22/05/2024.
//

import Foundation

extension Double {
    func toPrice(decimalPoint: Int = 1) -> String {
        return String(format: "%.\(decimalPoint)f", self)
    }
}
