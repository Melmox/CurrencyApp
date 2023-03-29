//
//  CurrencyHistoryInfoDetailsCell.swift
//  CurrencyApp
//
//  Created by developer_tmp on 22.03.2023.
//

import UIKit

class CurrencyHistoryInfoDetailsCell: BasicTableCell<CurrencyHistoryInfoDetailsCellViewModel> {
    
    var currencyExchangeCourceLabel = UILabel()
    var dateLabel = UILabel()
    var arrowImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none

        contentView.addSubview(currencyExchangeCourceLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(arrowImage)
        
        currencyExchangeCourceLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.translatesAutoresizingMaskIntoConstraints = false


        currencyExchangeCourceLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        currencyExchangeCourceLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
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
    
    // MARK: - ViewModel
    // MARK: Configure
    
    var currancyRateState: CurrencyRateState?

    
    override func configure(with viewModel: CurrencyHistoryInfoDetailsCellViewModel) {
        super.configure(with: viewModel)
        currencyExchangeCourceLabel.text = viewModel.value
        dateLabel.text = viewModel.title
        currancyRateState = viewModel.currancyRateState        
        
        switch viewModel.didSelected{
        case true:
            super.backgroundColor = .none
        case false:
            super.backgroundColor = .lightGray.withAlphaComponent(0.5)
        }

        switch currancyRateState {
        case .up:
            arrowImage.image = UIImage(systemName: viewModel.iconName)!.withTintColor(viewModel.color, renderingMode: .alwaysOriginal)
        case .down:
            arrowImage.image = UIImage(systemName: viewModel.iconName)!.withTintColor(viewModel.color, renderingMode: .alwaysOriginal)
        default:
            arrowImage.image = UIImage(systemName: viewModel.iconName)!.withTintColor(viewModel.color, renderingMode: .alwaysOriginal)
        }
    }
}
