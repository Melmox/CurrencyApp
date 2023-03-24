//
//  CurrencyHistoryInfoCell.swift
//  CurrencyApp
//
//  Created by developer_tmp on 22.03.2023.
//

import UIKit

class CurrencyHistoryInfoCell: BasicControllerTableCell<CurrencyHistoryInfoCellViewModel> {
    
    var currencyName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        contentView.backgroundColor = .systemMint
        
        currencyName.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(currencyName)

        currencyName.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        currencyName.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}