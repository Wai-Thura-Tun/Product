//
//  ProductSearchVC.swift
//  Product
//
//  Created by Wai Thura Tun on 23/05/2024.
//

import UIKit

class ProductSearchVC: UIViewController, StoryBoarded {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var tbSearch: UITableView!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    static var storyboardName: String = "Main"
    private lazy var vm: ProductSearchVM = .init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBinding()
    }
    
    private func setUpViews() {
        [btnBack].circleButton(shadowOpacity: 0.3,
                               offset: CGSize.init(width: 0, height: 0),
                               shadowRadius: 4)
        tbSearch.register(UINib.init(nibName: "ProductSearchCell", bundle: nil), forCellReuseIdentifier: "ProductSearchCell")
        tbSearch.dataSource = self
        tbSearch.delegate = self
        tfSearch.delegate = self
        tfSearch.becomeFirstResponder()
    }
    
    private func setUpBinding() {
        tfSearch.addTarget(self, action: #selector(onChangeSearch), for: .editingChanged)
        btnBack.addTarget(self, action: #selector(onTapBack), for: .touchUpInside)
    }
    
    @objc func onChangeSearch() {
        self.vm.setSearchInput(searchInput: tfSearch.text)
    }
    
    @objc func onTapBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProductSearchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductSearchCell", for: indexPath) as? ProductSearchCell
        guard let cell = cell else { return UITableViewCell.init() }
        cell.data = vm.products[indexPath.row]
        return cell
    }
}

extension ProductSearchVC: UITableViewDelegate {
    
}

extension ProductSearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.loading.startAnimating()
        self.vm.searchProduct()
        return true
    }
}

extension ProductSearchVC: ProductSearchViewDelegate {
    func onLoadProducts() {
        DispatchQueue.main.async { [weak self] in
            self?.loading.stopAnimating()
            self?.lblResult.text = "\(self?.vm.products.count ?? 0) results found"
            self?.tbSearch.reloadData()
        }
    }
    
    func onError(error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.loading.stopAnimating()
        }
    }
}
