//
//  BasicViewController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 16.03.2023.
//

import Foundation
import UIKit

protocol BasicControllerViewModel {
    func configure()
}

class BasicViewController<ViewModel: BasicControllerViewModel>: UIViewController {
    
    //MARK: - Properties
    //MARK: Content
    
    private(set) var viewModel: ViewModel
    
    //MARK: - Initialization
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - ViewModel
    //MARK: Configuration
    
    func configureViewModel() {
        viewModel.configure()
    }
}
