//
//  UIButton.swift
//  Product
//
//  Created by Wai Thura Tun on 22/05/2024.
//

import Foundation
import UIKit

extension Array where Element == UIButton {
    func circleButton(shadowOpacity: Float = 0.4,
                      offset: CGSize,
                      color: UIColor = UIColor.black,
                      shadowRadius: CGFloat = 3
    ) {
        self.forEach { item in
            item.layer.cornerRadius = item.frame.width / 2
            item.layer.shadowOpacity = shadowOpacity
            item.layer.shadowOffset = offset
            item.layer.shadowColor = color.cgColor
            item.layer.shadowRadius = shadowRadius
        }
    }
}
