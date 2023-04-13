//
//  BasicTableCell.swift
//  CurrencyApp
//
//  Created by developer_tmp on 21.03.2023.
//

import UIKit

class BasicTableCell<ViewModel>: UITableViewCell {
    
    // MARK: - Properties
    // MARK: Content
    
    private (set) var viewModel: ViewModel?
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel = nil
    }
    
    // MARK: - ViewModel
    // MARK: Configuration
    
    func configure(with viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}
