//
//  RootNC.swift
//  Product
//
//  Created by Wai Thura Tun on 21/05/2024.
//

import UIKit

class TabBarVC: UITabBarController {

    class CustomTabBar: UITabBar {
        override func sizeThatFits(_ size: CGSize) -> CGSize {
            var size = super.sizeThatFits(size)
            if UIDevice.current.userInterfaceIdiom == .phone {
                let screenHeight = UIScreen.main.bounds.height
                switch screenHeight {
                case (812..<926):
                    size.height = 90
                case let height where height >= 926:
                    size.height = 100
                default:
                    size.height = 70
                }
            }
            return size
        }
    }
    
    private var productListVC: ProductListVC {
        return ProductListVC.instantiate()
    }
    
    private var wishListVC: WishListVC {
        return WishListVC.instantiate()
    }
    
    private var cartVC: CartVC {
        return CartVC.instantiate()
    }
    
    private var profileVC: ProfileVC {
        return ProfileVC.instantiate()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        object_setClass(self.tabBar, CustomTabBar.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            productListVC,
            wishListVC,
            cartVC,
            profileVC
        ]
        
        tabBar.backgroundColor = .black
    }
}
