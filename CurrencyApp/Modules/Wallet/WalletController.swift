//
//  WalletController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 13.03.2023.
//

import UIKit

final class WalletController: BasicViewController<WalletViewModel>, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties

    let tableView = UITableView()
    let settingsButton = UIImageView(image: UIImage(systemName: "gear"))

    lazy var headerView: TableViewHeaderView = {
        let width = UIView.screenWidth
        let height = width * 0.6
        let headerView = TableViewHeaderView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        return headerView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44
        super.viewDidLoad()
        viewModel.configure()
        view.backgroundColor = .white
        setupTableView()
        tableView.register(WalletTableViewCell.self, forCellReuseIdentifier: "WalletTableViewCell")
        tableView.tableHeaderView = headerView
        viewModel.willReload = {
            self.tableView.reloadData()
        }
        configureNavigationBarHeader()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: - Constraints
    
    func configureNavigationBarHeader() {
        self.navigationController?.navigationBar.tintColor = .systemGreen
        settingsButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        settingsButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(settingsTapped(tapGestureRecognizer:)))
        settingsButton.isUserInteractionEnabled = true
        settingsButton.addGestureRecognizer(tapGestureRecognizer)
        let segmentBarItem = UIBarButtonItem(customView: settingsButton)
        navigationItem.rightBarButtonItem = segmentBarItem
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.isEditing = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
        
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WalletTableViewCell", for: indexPath) as! WalletTableViewCell
        let cellViewModel = viewModel.item(at: indexPath)
        cell.configure(with: cellViewModel)
        return cell
    }
    
    //MARK: - Moving cells
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = viewModel.cellViewModels[sourceIndexPath.row]
        viewModel.cellViewModels.remove(at: sourceIndexPath.row)
        viewModel.cellViewModels.insert(movedObject, at: destinationIndexPath.row)
    }
    
    // MARK: - Action

    @objc func settingsTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        viewModel.coordinateNextPage()
    }
}


