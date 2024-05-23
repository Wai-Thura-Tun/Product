//
//  ProductDetailCell.swift
//  Product
//
//  Created by Wai Thura Tun on 22/05/2024.
//

import UIKit

class ProductDetailCell: UICollectionViewCell {

    @IBOutlet weak var imgProductDetail: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var viewPrice: UIView!
    
    var data: (String?, Double?)  = (nil, nil) {
        didSet {
            imgProductDetail.setImage(imgURL: data.0)
            lblPrice.text = "$\(data.1?.toPrice(decimalPoint: 0) ?? "")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewPrice.layer.shadowOpacity = 0.4
        viewPrice.layer.shadowColor = UIColor.black.cgColor
        viewPrice.layer.shadowRadius = 5
        viewPrice.layer.shadowOffset = .init(width: 0, height: 0)
    }
}
