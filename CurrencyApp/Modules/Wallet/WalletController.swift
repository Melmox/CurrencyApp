//
//  WalletController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 13.03.2023.
//

import UIKit

final class WalletController: BasicViewController<WalletViewModel>, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    // MARK: Content
    
    let tableView = UITableView()
    let settingsButton = UIImageView(image: UIImage(systemName: "gear"))
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
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
        settingsButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        settingsButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(settingsTapped(tapGestureRecognizer:)))
        settingsButton.isUserInteractionEnabled = true
        settingsButton.addGestureRecognizer(tapGestureRecognizer)
        let segmentBarItem = UIBarButtonItem(customView: settingsButton)
        navigationItem.rightBarButtonItem = segmentBarItem
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44
        tableView.isEditing = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func setupHeader() {
        var headerViewModel = TableViewHeaderViewModel()
        let header = TableViewHeaderView(viewModel: headerViewModel,
                                         frame: CGRect(x: 0, y: 0,
                                                       width: headerViewModel.widthOfHeader,
                                                       height: headerViewModel.heightOfHeader))
        headerViewModel = header.viewModel ?? TableViewHeaderViewModel()
        tableView.tableHeaderView = header
        viewModel.willReloadHeader = { [weak self] in
            if let collback = headerViewModel.willReload {
                header.viewModel?.items = self?.viewModel.tableHeaderViewModel?.items
                collback()
            }
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
        viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WalletTableViewCell", for: indexPath) as! WalletTableViewCell
        let cellViewModel = viewModel.item(at: indexPath)
        cell.configure(with: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = viewModel.cellViewModels[sourceIndexPath.row]
        viewModel.cellViewModels.remove(at: sourceIndexPath.row)
        viewModel.cellViewModels.insert(movedObject, at: destinationIndexPath.row)
    }
}


