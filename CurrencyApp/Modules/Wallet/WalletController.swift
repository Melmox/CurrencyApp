//
//  WalletController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 13.03.2023.
//

import UIKit

final class WalletController: BasicViewController<WalletViewModel>, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - General
    
    var smth: () = WalletViewModel(coordinator: Coordinator(window: UIWindow())).configure()
    let tableView = UITableView()
    var preparedData = WalletViewModel(coordinator: Coordinator(window: UIWindow())).prepareString()

    lazy var headerView: TableViewHeaderView = {
        let width = UIView.screenWidth
        let height = width * 0.6
        let headerView = TableViewHeaderView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        return headerView
    }()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44

        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.systemPink
        setupTableView()
        tableView.register(WalletTableViewCell.self, forCellReuseIdentifier: "WalletTableViewCell")
        tableView.tableHeaderView = headerView
    }
    
    //MARK: - Constraints
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.isEditing = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    //MARK: - UITableView
    //MARK: Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WalletViewModel(coordinator: Coordinator(window: UIWindow())).numberOfItems
    }
    
    //MARK: DataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WalletTableViewCell", for: indexPath) as! WalletTableViewCell
        cell.exchangeRatelabel.text = preparedData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.preparedData[sourceIndexPath.row]
        preparedData.remove(at: sourceIndexPath.row)
        preparedData.insert(movedObject, at: destinationIndexPath.row)
    }
}


