//
//  ProductSearchCell.swift
//  Product
//
//  Created by Wai Thura Tun on 23/05/2024.
//

import UIKit

class ProductSearchCell: UITableViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    var data: ProductVO? = nil {
        didSet {
            if let data = data {
                imgProduct.setImage(imgURL: data.thumbnail)
                lblTitle.text = data.title
                lblCategory.text = data.category
                lblPrice.text = "$\(data.price?.toPrice(decimalPoint: 2) ?? "")"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
