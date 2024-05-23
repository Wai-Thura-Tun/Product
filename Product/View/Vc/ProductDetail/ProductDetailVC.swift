//
//  ProductDetailVC.swift
//  Product
//
//  Created by Wai Thura Tun on 22/05/2024.
//

import UIKit

class ProductDetailVC: UIViewController, StoryBoarded {

    @IBOutlet weak var cvProductDetails: UICollectionView!
    @IBOutlet weak var lblBrand: UILabel!
    @IBOutlet weak var lblTitel: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var productImgControl: UIPageControl!
    @IBOutlet weak var btnBack: UIButton!
    
    static var storyboardName: String = "Main"
    private lazy var vm: ProductDetailVM = .init(delegate: self)
    var productId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        setUpBindings()
        if let productId = productId {
            vm.getProductDetail(id: productId)
        }
    }
    
    private func setUpViews() {
        [btnBack].circleButton(shadowOpacity: 0.3,
                               offset: CGSize.init(width: 0, height: 0),
                               shadowRadius: 4)
        cvProductDetails.register(UINib.init(nibName: "ProductDetailCell", bundle: nil), forCellWithReuseIdentifier: "ProductDetailCell")
        cvProductDetails.dataSource = self
        cvProductDetails.delegate = self
        cvProductDetails.isPagingEnabled = true
    }
    
    private func setUpBindings() {
        btnBack.addTarget(self, action: #selector(onTapBack), for: .touchUpInside)
    }
    
    @objc func onTapBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension ProductDetailVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = vm.product?.images.count ?? 0
        productImgControl.numberOfPages = count
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailCell", for: indexPath) as? ProductDetailCell
        guard let cell = cell else { return UICollectionViewCell.init() }
        cell.data = (vm.product?.images[indexPath.row], vm.product?.price)
        return cell
    }
}

extension ProductDetailVC: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollIndex = Int(scrollView.contentOffset.x / view.frame.width)
        productImgControl.currentPage = scrollIndex
    }
}

extension ProductDetailVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 400)
    }
}

extension ProductDetailVC: ProductDetailViewDelegate {
    func onLoadProductDetail() {
        DispatchQueue.main.async { [weak self] in
            self?.bindData()
            self?.cvProductDetails.reloadData()
        }
    }
    
    func onError(error: String) {
        
    }
    
    private func bindData() {
        if let product = vm.product {
            lblBrand.text = product.brand
            lblTitel.text = product.title
            lblDescription.text = product.description
        }
    }
}
