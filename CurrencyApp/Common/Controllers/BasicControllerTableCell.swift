//
//  BasicControllerTableCell.swift
//  CurrencyApp
//
//  Created by developer_tmp on 21.03.2023.
//

import Foundation
import UIKit

protocol BasicControllerUITableViewCell {
    func configure()
}

class BasicControllerTableCell<TableViewCell: BasicControllerUITableViewCell>: UITableViewCell {
    
//    private(set) var tableViewCell: TableViewCell
    

    
//    init(tableViewCell: BasicControllerUITableViewCell) {
//        self.tableViewCell = tableViewCell as! TableViewCell
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }


    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }
    
    func initView() {
        backgroundColor = .clear
        
        translatesAutoresizingMaskIntoConstraints = false
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }
}
