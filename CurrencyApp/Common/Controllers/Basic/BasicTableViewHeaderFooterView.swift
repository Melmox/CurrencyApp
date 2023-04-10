//
//  BasicTableViewHeaderFooterView.swift
//  CurrencyApp
//
//  Created by developer_tmp on 29.03.2023.
//

import UIKit

class BasicTableViewHeaderFooterView<ViewModel>: UITableViewHeaderFooterView {
    
    // MARK: - Properties
    // MARK: Content
    
    private(set) var viewModel: ViewModel?
    
    // MARK: - Initialization
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewModel = nil
    }
    
    // MARK: - View
    // MARK: Configuration
    
    func configureView() {
        
    }
    
    // MARK: - ViewModel
    // MARK: Configuration
    
    func configure(with viewModel: ViewModel) {
        self.viewModel = viewModel
    }
}
