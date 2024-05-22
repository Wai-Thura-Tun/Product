//
//  Storyboarded.swift
//  Product
//
//  Created by Wai Thura Tun on 20/05/2024.
//

import Foundation
import UIKit

protocol StoryBoarded {
    static var storyboardName: String { get set }
    static func instantiate(bundle: Bundle) -> Self
}

extension StoryBoarded {
    static func instantiate(bundle: Bundle = Bundle.main) -> Self {
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: bundle)
        return storyboard.instantiateViewController(withIdentifier: String(describing: Self.self)) as! Self
    }
}

