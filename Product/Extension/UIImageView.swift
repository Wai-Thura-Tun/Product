//
//  UIImage.swift
//  Product
//
//  Created by Wai Thura Tun on 22/05/2024.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(imgURL: String?, 
                  cornerRadius: CGFloat = 10,
                  animateDuration: TimeInterval = 1,
                  withLoading: Bool = true
    ) {
        guard let imgURL = imgURL else { return }
        let url = URL(string: imgURL)
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
                        |> RoundCornerImageProcessor(cornerRadius: cornerRadius)
        self.kf.indicatorType = withLoading ? .activity : .none
        self.kf.setImage(with: url,
                         options: [
                            .processor(processor),
                            .scaleFactor(UIScreen.main.scale),
                            .transition(.fade(animateDuration)),
                            .cacheOriginalImage
                         ])
    }
}
