//
//  RootNC.swift
//  Product
//
//  Created by Wai Thura Tun on 21/05/2024.
//

import UIKit

class RootNC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        goToProductList()
    }
    
    private func goToProductList() {
        let vc = TabBarVC.init()
        pushViewController(vc, animated: true)
    }
}
