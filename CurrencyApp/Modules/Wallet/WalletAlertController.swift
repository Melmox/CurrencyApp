//
//  WalletAlertController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 12.04.2023.
//

import UIKit

final class WalletAlertViewModel {

    
    
    // MARK: - Properties
    // MARK: Content
    
    private weak var coordinator: MainFlowCoordinator?
    
    private var listOfCurrency: [String] = ["UAH",
                                            "USD",
                                            "EUR",
                                            "PLN",
                                            "GBP",
                                            "CHF",
                                            "CNH",
                                            "CAD"]
    
    // MARK: - Services
    
    private var cardService: CardServiceable?

    // MARK: - Initialization
    
    init(coordinator: MainFlowCoordinator, cardService: CardServiceable) {
        self.coordinator = coordinator
        self.cardService = cardService
    }
    
    // MARK: - Appearance
    
    func configure() {}
    
    // MARK: - Provider
    
    func addCard(with currency: String) {
        cardService?.addCreditCard(with: currency)
    }
    
    func getItem(at row: Int) -> String {
        listOfCurrency[row]
    }
    
    var numberOfItems: Int {
        listOfCurrency.count
    }
    
}

final class WalletAlertController: UIAlertController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Properties
    // MARK: Content
    
    let viewModel: WalletAlertViewModel
    
    let pickerView = UIPickerView()
    
    private lazy var chosedCurrency: String = "UAH"
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - Initialization
    
    init(viewModel: WalletAlertViewModel) {
        self.viewModel = viewModel
//        super.init(title: nil, message: nil, preferredStyle: .alert)
        super.init(nibName: nil, bundle: nil)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View
    // MARK: Configure
    
    func configureView() {
        configureAlert()
        configurePicker()
    }
    
    func configureAlert() {
        self.title = "Select currency for your future card from list"
        self.message = "\n\n\n\n\n\n\n\n\n"
        self.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.viewModel.addCard(with: self.chosedCurrency)
        }))
    }
    
    func configurePicker() {
        self.view.addSubview(pickerView)
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.frame.size.width = self.view.frame.size.width
    }
    
    // MARK: - Action
    
    
    
    // MARK: - UIPickerViewDelegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.numberOfItems
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chosedCurrency = viewModel.getItem(at: row)
    }
    
    // MARK: - UIPickerViewDataSource
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        viewModel.getItem(at: row)
    }
}
