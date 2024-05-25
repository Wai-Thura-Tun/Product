//
//  RootNC.swift
//  Product
//
//  Created by Wai Thura Tun on 21/05/2024.
//

import UIKit

class CustomTabBar: UITabBar {
    private var shapeLayer: CALayer?
    
    override func draw(_ rect: CGRect) {
        self.addShape()
    }

    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1.0

        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }

    private func createPath() -> CGPath {
        let path = UIBezierPath()
        let actualWidth = self.frame.width
        let actualHeight = self.frame.height
        let curvedWidth: CGFloat = actualWidth * 0.7
        let widthX = (actualWidth - curvedWidth) / 2
        let widthY = (actualWidth + curvedWidth) / 2
        let heightX = 10
        let heightY = self.frame.height - 20
        let totalTabBarHeight = actualHeight - 10 - 20
            
        path.move(to: CGPoint(x: Int(widthX), y: Int(heightX)))
        path.addLine(to: CGPoint(x: Int(widthY), y: Int(heightX)))
        path.addLine(to: CGPoint(x: Int(widthX), y: Int(heightY)))
        path.addArc(withCenter: CGPoint(
            x: Int(widthY),
            y: Int((totalTabBarHeight / 2) + 10)),
            radius: totalTabBarHeight / 2,
            startAngle: -.pi/2,
            endAngle: .pi/2,
            clockwise: true)

        path.addArc(withCenter: CGPoint(
            x: Int(widthX),
            y: Int((totalTabBarHeight / 2) + 10)),
            radius: totalTabBarHeight / 2,
            startAngle: .pi/2,
            endAngle: -.pi/2,
            clockwise: true)
        
        path.close()
        return path.cgPath
    }

    override func layoutSubviews() {
        super.layoutSubviews()
            
        let totalItems = CGFloat(items?.count ?? 0)
        let itemWidth = self.frame.width * 0.8 / totalItems
        let itemHeight = self.frame.height
        var itemX: CGFloat = (self.frame.width - (itemWidth * totalItems)) / 2
        for item in subviews where item is UIControl {
            item.frame = CGRect(x: itemX, y: 0, width: itemWidth, height: itemHeight)
            itemX += itemWidth
        }
        
        for view in self.subviews where view is UIControl {
            self.bringSubviewToFront(view)
        }
    }
}

class TabBarVC: UITabBarController {
    
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
        self.setValue(CustomTabBar(), forKey: "tabBar")
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
    }
}
