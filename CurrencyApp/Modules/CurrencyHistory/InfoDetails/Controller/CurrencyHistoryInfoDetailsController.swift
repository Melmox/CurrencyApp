//
//  CurrencyHistoryInfoDetailsController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 21.03.2023.
//

import UIKit

final class CurrencyHistoryInfoDetailsController: BasicViewController<CurrencyHistoryInfoDetailsViewModel>, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    // MARK: Content
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        setupTableView()
        viewModel.configure()
        tableView.register(CurrencyHistoryInfoDetailsCell.self, forCellReuseIdentifier: CurrencyHistoryInfoDetailsCell.identifier)
        tableView.register(CurrencyHistoryInfoDetailsSectionView.self, forHeaderFooterViewReuseIdentifier: CurrencyHistoryInfoDetailsSectionView.identifier)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    //MARK: - Constraints
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 44
        tableView.sectionHeaderHeight = 44
        tableView.sectionHeaderTopPadding = 0
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    //MARK: - ViewModel
    //MARK: Configuration
    
    override func configureViewModel() {
        viewModel.willReload = { [unowned self] in
            self.tableView.reloadData()
        }
        viewModel.willReloadSection = { [unowned self] (section) in
            self.tableView.reloadSections([section], with: .automatic)
        }
        super.configureViewModel()
    }
    
    //MARK: - TableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath)
        tableView.reloadData()
    }
    
    //MARK: - TableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyHistoryInfoDetailsCell.identifier, for: indexPath) as! CurrencyHistoryInfoDetailsCell
        let cellViewModel =  viewModel.item(at: indexPath)
        cell.configure(with: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionViewModel = viewModel.sectionHeader(at: section)
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CurrencyHistoryInfoDetailsSectionView.identifier) as? CurrencyHistoryInfoDetailsSectionView
        headerView?.configure(with: sectionViewModel)
        headerView?.didSelect = { [weak self] in
            self?.viewModel.didSelectSection(at: section)
        }
        return headerView
    }
}
