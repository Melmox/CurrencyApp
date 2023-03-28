//
//  CurrencyHistoryCurrencyNameCell.swift
//  CurrencyApp
//
//  Created by developer_tmp on 15.03.2023.
//

import UIKit

class CurrencyHistoryCurrencyNameCell : BasicTableCell<CurrencyHistoryCurrencyNameCellViewModel> {
    
    var currencyNameLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none

//        contentView.backgroundColor = .systemYellow

        currencyNameLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(currencyNameLabel)

        currencyNameLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        currencyNameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewModel
    // MARK: Configure
    
    override func configure(with viewModel: CurrencyHistoryCurrencyNameCellViewModel) {
        super.configure(with: viewModel)
        currencyNameLabel.text = viewModel.currencyName
    }
}
