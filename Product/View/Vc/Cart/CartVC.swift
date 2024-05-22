//
//  CartVC.swift
//  Product
//
//  Created by Wai Thura Tun on 21/05/2024.
//

import UIKit

class CartVC: UIViewController, StoryBoarded {

    static var storyboardName: String = "Main"
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        tabBarItem = .init(title: nil,
                           image: UIImage(named: "cart-normal"),
                           selectedImage: UIImage(named: "cart-select"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
