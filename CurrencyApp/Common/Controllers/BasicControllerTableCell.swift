//
//  BasicControllerTableCell.swift
//  CurrencyApp
//
//  Created by developer_tmp on 21.03.2023.
//

import Foundation
import UIKit

protocol BasicControllerUITableViewCell {
    func prepareForReuse()
    
    func awakeFromNib()
    
    func initView()
}

class BasicControllerTableCell<TableViewCell: BasicControllerUITableViewCell>: UITableViewCell {

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initView()
    }
    
    func initView() {
        translatesAutoresizingMaskIntoConstraints = false
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }
}
