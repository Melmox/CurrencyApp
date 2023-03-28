//
//  CurrencyHistoryCurrencyNameController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 13.03.2023.
//

import UIKit

class CurrencyHistoryCurrencyNameController: BasicViewController<CurrencyHistoryCurrencyNameViewModel>, UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: - General
    let tableView = UITableView()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44

        super.viewDidLoad()
        setupTableView()
        tableView.register(CurrencyHistoryCurrencyNameCell.self, forCellReuseIdentifier: "CurrencyHistoryCurrencyNameCell")
        viewModel.configure()
        viewModel.willReload = {
            self.tableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
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
        return viewModel.numberOfItems
    }
    
    //MARK: - TableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyHistoryCurrencyNameCell", for: indexPath) as! CurrencyHistoryCurrencyNameCell
        let cellViewModel = viewModel.item(at: indexPath)
        cell.configure(with: cellViewModel)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    //MARK: - TableViewAction
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.coordinateNextPage(title: viewModel.cellViewModels[indexPath.row].currencyName)
        self.tabBarController?.tabBar.isHidden = true
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Currency List", style: .plain, target: nil, action: nil)
    }
}


