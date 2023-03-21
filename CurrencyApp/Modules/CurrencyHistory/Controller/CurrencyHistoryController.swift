//
//  CurrencyHistoryController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 13.03.2023.
//

import UIKit

class CurrencyHistoryController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    //MARK: - General
    let tableView = UITableView()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.systemPink
        setupTableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.tableHeaderView = headerView
        
        //headerView(viewModel: viewModel.header)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
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
    
    //MARK: - TableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //MARK: - TableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Cell \(indexPath.row)"
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
    
    //MARK: - TableViewAction
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let destination = CurrencyHistoryInfoTableController()
//        destination.view.backgroundColor = .red
//        destination.title = "Cell \(indexPath.row)"
        destination.navigationItem.title = "Cell \(indexPath.row)"
        self.navigationController?.pushViewController(destination, animated: true)
    }
}


