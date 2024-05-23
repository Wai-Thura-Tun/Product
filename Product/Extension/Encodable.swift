//
//  Encodable.swift
//  Product
//
//  Created by Wai Thura Tun on 23/05/2024.
//

import Foundation

extension Encodable {
    func toDict() -> [String: Any] {
        do {
            let encodedData = try JSONEncoder().encode(self)
            let dict = try JSONSerialization.jsonObject(with: encodedData) as? [String: Any]
            return dict ?? [:]
        }
        catch {
            return [:]
        }
    }
}
