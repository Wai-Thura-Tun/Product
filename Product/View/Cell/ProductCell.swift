//
//  ProductCell.swift
//  Product
//
//  Created by Wai Thura Tun on 21/05/2024.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    var data: ProductVO? = nil {
        didSet {
            if let data = data {
                imgProduct.setImage(imgURL: data.thumbnail)
                lblPrice.text = "$ \(data.price ?? 0)"
                lblName.text = data.title
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
