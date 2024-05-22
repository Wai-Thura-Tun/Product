//
//  ProfileVC.swift
//  Product
//
//  Created by Wai Thura Tun on 21/05/2024.
//

import UIKit

class ProfileVC: UIViewController, StoryBoarded {
    
    static var storyboardName: String = "Main"

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        tabBarItem = .init(title: nil,
                           image: UIImage(named: "profile-normal"),
                           selectedImage: UIImage(named: "profile-select"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
