//
//  WalletDetailsController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 10.04.2023.
//

import UIKit

enum WalletCardDetaisTab {
    case topUp, transactionHistory
}

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
    }
    
    private func configureNavigationBar() {
        self.navigationController?.navigationBar.tintColor = .systemGreen
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.register(WalletDetailsCellTopUpView.self, forCellReuseIdentifier: WalletDetailsCellTopUpView().identifier)
    }
    
    private func setupHeader() {
        let widthOfHeader = UIView.screenWidth
        let heightOfHeader = UIView.screenWidth * 0.7
        viewModel.willReloadHeader = { [weak self] in
            let headerViewModel = self?.viewModel.headerViewModel
            let header = WalletDetailsHeaderView(frame: CGRect(x: 0,
                                                               y: 0,
                                                               width: widthOfHeader,
                                                               height: heightOfHeader),
                                                 viewModel: headerViewModel)
            self?.tableView.tableHeaderView = header
        }
    }
    
    // MARK: - View Model
    // MARK: Configure
    
    override func configureViewModel() {
        viewModel.willReloadCell = { [weak self] in
            self?.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        }
        viewModel.willReload = { [weak self] in
            self?.tableView.reloadData()
        }
        super.configureViewModel()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.walletCardDetaisTabState {
        case .topUp:
            return 1
        case .transactionHistory:
            return 10 // viewModel.count
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.walletCardDetaisTabState {
        case .topUp:
            let cell = tableView.dequeueReusableCell(withIdentifier: WalletDetailsCellTopUpView().identifier, for: indexPath) as! WalletDetailsCellTopUpView
            if let cellViewModel = viewModel.cellViewModel {
                cell.configure(with: cellViewModel)
            }
            return cell
        case .transactionHistory:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch viewModel.walletCardDetaisTabState {
        case .topUp:
            tableView.separatorStyle = .none
            return 400
        case .transactionHistory:
            tableView.separatorStyle = .singleLine
            return 44
        }
    }
}

