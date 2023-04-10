//
//  WalletDetailsController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 10.04.2023.
//

import UIKit

final class WalletDetailsController: BasicViewController<WalletDetailsViewModel>, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    // MARK: Content
    
    let tableView = UITableView()
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - View
    // MARK: Configure
    
    override func configureView() {
        super.configureView()
        
        view.backgroundColor = .white
        configureNavigationBar()
        setupTableView()
        setupHeader()
        
        tableView.register(WalletTableViewCell.self, forCellReuseIdentifier: "WalletTableViewCell")
    }
    
    private func configureNavigationBar() {
        self.navigationController?.navigationBar.tintColor = .systemGreen
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func setupHeader() {
        let widthOfHeader = UIView.screenWidth
        let heightOfHeader = UIView.screenWidth * 0.6
        if let cellDetailedInfo = viewModel.cardInfoViewModel {
        let header = WalletDetailsHeaderView(frame: CGRect(x: 0, y: 0,
                                                               width: widthOfHeader,
                                                               height: heightOfHeader), viewModel: cellDetailedInfo)
            tableView.tableHeaderView = header
            tableView.tableHeaderView?.heightAnchor.constraint(equalToConstant: heightOfHeader).isActive = true
        }
    }
    
    // MARK: - View Model
    // MARK: Configure

    override func configureViewModel() {
        viewModel.willReload = { [weak self] in
            self?.tableView.reloadData()
        }
        super.configureViewModel()
    }
    
    // MARK: - Actions
    
    @objc
    private func settingsTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        viewModel.coordinateNextPage()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        viewModel.numberOfItems
        3
    }

    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WalletTableViewCell", for: indexPath) as! WalletTableViewCell
//        let cellViewModel = viewModel.item(at: indexPath)
//        cell.configure(with: cellViewModel)
        return cell
    }
}

