//
//  WalletTableViewCell.swift
//  CurrencyApp
//
//  Created by developer_tmp on 21.03.2023.
//

import UIKit

final class WalletTableViewCell: BasicTableCell<WalletTableViewCellViewModel> {
    
    var exchangeRatelabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        exchangeRatelabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(exchangeRatelabel)
        exchangeRatelabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: frame.width*0.05).isActive = true
        exchangeRatelabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewModel
    // MARK: Configure
    
    override func configure(with viewModel: WalletTableViewCellViewModel) {
        super.configure(with: viewModel)
        exchangeRatelabel.text = viewModel.title
    }
}
