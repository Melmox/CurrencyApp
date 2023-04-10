//
//  WalletSettingsTableCell.swift
//  CurrencyApp
//
//  Created by developer_tmp on 05.04.2023.
//

import UIKit

class WalletSettingsTableCell: BasicTableCell<WalletSettingsTableCellViewModel> {
    
    // MARK: - Properties
    // MARK: Content
    
    let identifier = String(describing: WalletSettingsTableCell.self)
    var settingLable = UILabel()
    
    // MARK: Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        settingLable.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(settingLable)
        settingLable.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        settingLable.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewModel
    // MARK: Configure
    
    override func configure(with viewModel: WalletSettingsTableCellViewModel) {
        super.configure(with: viewModel)
        settingLable.text = viewModel.title
    }
}
