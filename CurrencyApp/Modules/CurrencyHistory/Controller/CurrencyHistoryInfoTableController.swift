//
//  CurrencyHistoryInfoTableController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 21.03.2023.
//

import Foundation
import UIKit

class CurrencyHistoryInfoTableController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var visibilityOfSections = [false, false, false]
    
    //MARK: - General
    let tableView = UITableView()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        setupTableView()
        tableView.register(CurrencyHistoryInfoCell.self, forCellReuseIdentifier: "CurrencyHistoryInfoCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    //MARK: - Constraints
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 44;
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    //MARK: - TableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return visibilityOfSections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            if visibilityOfSections[section] == true{ return 7 }
            else{ return 0 }
        case 1:
            if visibilityOfSections[section] == true{ return 14 }
            else{ return 0 }
        case 2:
            if visibilityOfSections[section] == true{ return 31 }
            else{ return 0 }
        default:
            return 0
        }
    }
    
    //MARK: - TableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyHistoryInfoCell", for: indexPath) as! CurrencyHistoryInfoCell
        cell.dateLabel.text = "01.01.2001"
        cell.currencyLabel.text = "36.6$"
//        cell.arrowImage.image = UIImage(systemName: "arrow.up.right")!.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        cell.arrowImage.image = UIImage(systemName: "arrow.down.right")!.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        cell.selectionStyle = .none
        return cell
    }
    
    //MARK: - TableViewHeaderInSection
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        tableView.sectionHeaderTopPadding = 0
        let frame = tableView.frame
        tableView.sectionHeaderHeight = frame.size.height * 0.05
        let headerView = UIView(frame: CGRectMake(0, 0, frame.size.width, tableView.sectionHeaderHeight))
        
        let button = UIButton(frame: CGRectMake(0, 0, frame.size.width, headerView.frame.size.height))
        button.setImage(UIImage(systemName: "chevron.down")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        button.tag = section
        button.setTitle("Section \(section)", for: .normal)
        button.backgroundColor = .systemGray
        
        
        button.semanticContentAttribute = .forceRightToLeft
        
        
        
        button.tag = section
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        headerView.addSubview(button)
        
        return headerView
    }
    
    @objc func buttonAction(sender: UIButton!) {
        visibilityOfSections[sender.tag] = visibilityOfSections[sender.tag] ? false : true
        //        print(visibilityOfSections[sender.tag])
        //         print("Button Clicked")
        tableView.reloadData()
    }
}
