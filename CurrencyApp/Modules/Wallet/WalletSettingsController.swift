//
//  WalletSettingsController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 05.04.2023.
//

import UIKit

class WalletSettingsController: BasicViewController<WalletSettingsViewModel>, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    // MARK: Content
    
    let tableView = UITableView()
    
    lazy var headerView: UIView? = {
        let headerView = WalletSettingsHeader(viewModel: WalletSettingsHeaderViewModel(service: viewModel.getUserService()))
        return headerView
    }()
    
    lazy var footerView: WalletSettingsTableFooter = {
        let footerView = WalletSettingsTableFooter(frame: CGRect(x: 0, y: 0, width:  UIView.screenWidth, height: 44))
        footerView.openWebView = { [weak self] in
            self?.viewModel.presentWebView()
        }
        return footerView
    }()
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - View
    // MARK: Configure
    
    override func configureView() {
        super.configureView()
        self.navigationItem.title = "Settings"
        let titleAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)
        ]
        self.navigationController?.navigationBar.titleTextAttributes = titleAttributes
        view.backgroundColor = .white
        setupTableView()
        tableView.register(WalletSettingsTableCell.self, forCellReuseIdentifier: WalletSettingsTableCell().identifier)
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.alwaysBounceVertical = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44
        tableView.tableFooterView = footerView
        tableView.tableHeaderView = headerView
    }
    
    // MARK: - View Model
    // MARK: Configure
    
    override func configureViewModel() {
        viewModel.willReload = { [weak self] in
            self?.tableView.reloadData()
        }
        super.configureViewModel()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WalletSettingsTableCell().identifier, for: indexPath) as! WalletSettingsTableCell
        let cellViewModel = viewModel.item(at: indexPath)
        cell.configure(with: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath)
    }
}
