//
//  WishListVC.swift
//  Product
//
//  Created by Wai Thura Tun on 21/05/2024.
//

import UIKit

class WishListVC: UIViewController, StoryBoarded {

    static var storyboardName: String = "Main"
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        tabBarItem = .init(title: nil,
                           image: UIImage(named: "heart-normal"),
                           selectedImage: UIImage(named: "heart-select"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
