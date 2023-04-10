//
//  BasicControllerCollectionViewCell.swift
//  CurrencyApp
//
//  Created by developer_tmp on 17.03.2023.
//

import Foundation
import UIKit

class BasicControllerCollectionViewCell<ViewModel>: UICollectionViewCell {
    
    // MARK: - Properties
    // MARK: Content
    
    private var viewModel: ViewModel?

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
