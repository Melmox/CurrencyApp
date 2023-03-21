//
//  WalletController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 13.03.2023.
//

import UIKit

final class WalletController: BasicViewController<WalletViewModel>, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - General
    let tableView = UITableView()
    lazy var headerView: TableViewHeaderView = {
        let width = UIView.screenWidth
        let height = width * 0.6
        let headerView = TableViewHeaderView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        return headerView
    }()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.systemPink
        setupTableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableHeaderView = headerView
    }
    
    //MARK: - Constraints
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    //MARK: - UITableView
    //MARK: Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    //MARK: DataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Cell \(indexPath.row)"
        cell.selectionStyle = .none
        return cell
    }
}


