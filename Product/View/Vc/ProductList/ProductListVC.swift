//
//  ProductListVC.swift
//  Product
//
//  Created by Wai Thura Tun on 21/05/2024.
//

import UIKit

class ProductListVC: UIViewController, StoryBoarded {

    @IBOutlet weak var cvProductList: UICollectionView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var btnSetting: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    
    static var storyboardName: String = "Main"
    private lazy var vm: ProductListVM = .init(delegate: self)
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        tabBarItem = .init(title: nil,
                           image: UIImage(named: "home-normal"),
                           selectedImage: UIImage(named: "home-select"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpBinding()
        loading.startAnimating()
        vm.getBooks()
    }
    
    private func setUpView() {
        [btnSearch, btnSetting].circleButton(shadowOpacity: 0.3, 
                                             offset: CGSize.init(width: 0, height: 0),
                                             shadowRadius: 4)
        cvProductList.register(UINib.init(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        cvProductList.dataSource = self
        cvProductList.delegate = self
        cvProductList.contentInset = .init(top: 0, left: 20, bottom: 20, right: 20)
    }
    
    private func setUpBinding() {
        btnSearch.addTarget(self, action: #selector(onTapSearch), for: .touchUpInside)
    }
    
    @objc func onTapSearch() {
        let vc = ProductSearchVC.instantiate()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ProductListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell
        guard let cell = cell else { return UICollectionViewCell.init() }
        cell.data = vm.products[indexPath.row]
        return cell
    }
}

extension ProductListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productId = vm.products[indexPath.row].id
        let vc = ProductDetailVC.instantiate()
        vc.productId = productId
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProductListVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing = 10 + collectionView.contentInset.left + collectionView.contentInset.right + 1
        let width = (collectionView.frame.width - totalSpacing) / 2
        return .init(width: width, height: 279)
    }
}

extension ProductListVC: ProductListViewDelegate {
    func onLoadProducts() {
        DispatchQueue.main.async { [weak self] in
            self?.loading.stopAnimating()
            self?.cvProductList.reloadData()
        }
    }
    
    func onError(error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.loading.stopAnimating()
        }
    }
}
