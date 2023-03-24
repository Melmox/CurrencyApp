//
//  CurrencyHistoryInfoCell.swift
//  CurrencyApp
//
//  Created by developer_tmp on 22.03.2023.
//

import UIKit

class CurrencyHistoryInfoCell: BasicControllerTableCell<CurrencyHistoryInfoCellViewModel> {
    
    var currencyLabel = UILabel()
    var dateLabel = UILabel()
    var arrowImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
//        contentView.backgroundColor = .systemMint
        
        

        contentView.addSubview(currencyLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(arrowImage)
        
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.translatesAutoresizingMaskIntoConstraints = false


        currencyLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        currencyLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
        dateLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: self.contentView.frame.width * 0.05).isActive = true
        dateLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
        arrowImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -self.contentView.frame.width * 0.05).isActive = true
        arrowImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        arrowImage.heightAnchor.constraint(equalToConstant: self.contentView.frame.height * 0.8).isActive = true
        arrowImage.widthAnchor.constraint(equalToConstant: self.contentView.frame.height * 0.8).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
