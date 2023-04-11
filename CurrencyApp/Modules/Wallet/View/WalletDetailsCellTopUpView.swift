//
//  WalletDetailsCellTopUpView.swift
//  CurrencyApp
//
//  Created by developer_tmp on 11.04.2023.
//

import UIKit

struct WalletDetailsCellTopUpViewModel {
    var creditCards: [CreditCard]
}

final class WalletDetailsCellTopUpView: BasicTableCell<WalletDetailsCellTopUpViewModel>, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Properties
    // MARK: Content
    
    let identifier = String(describing: WalletDetailsCellTopUpView.self)
    
    private lazy var cardPicker = UIPickerView()
    private lazy var cardTextField = UITextField()
    private lazy var amountTextField = UITextField()
    private lazy var sendButton = UIButton()
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
                
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(amountTextField)
        amountTextField.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        amountTextField.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        amountTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        amountTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        
        cardTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cardTextField)
        cardTextField.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        cardTextField.bottomAnchor.constraint(equalTo: amountTextField.topAnchor, constant: -10).isActive = true
        cardTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        cardTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sendButton)
        sendButton.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        sendButton.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 10).isActive = true
        sendButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        sendButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        
        
        setProperties(for: amountTextField)
        amountTextField.placeholder = "Input amount"
        amountTextField.autocorrectionType = .no
        amountTextField.returnKeyType = .default
        amountTextField.keyboardType = .decimalPad
        amountTextField.textAlignment = .center

        setProperties(for: cardTextField)
        cardTextField.placeholder = "Choose card"
        cardTextField.inputView = cardPicker
        cardTextField.textAlignment = .center
        
        sendButton.setTitle("Top up this card", for: .normal)
        sendButton.backgroundColor = .systemGreen
        sendButton.layer.cornerRadius = 15
        sendButton.titleLabel?.font =  sendButton.titleLabel?.font.withSize(20)
        sendButton.setTitleColor(.black, for: .normal)
        
        cardPicker.delegate = self
        cardPicker.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setProperties(for textField: UITextField) {
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 15
        textField.font = textField.font?.withSize(20)
        textField.autocapitalizationType = .none
    }
    
    // MARK: - ViewModel
    // MARK: Configure
    
    override func configure(with viewModel: WalletDetailsCellTopUpViewModel) {
        super.configure(with: viewModel)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let viewModel = viewModel {
            return viewModel.creditCards.count
        } else {return 0}
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let viewModel = viewModel {
                let title = "\(viewModel.creditCards[row].currency) - \(viewModel.creditCards[row].cardNumber)"
                return title
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let viewModel = viewModel {
            cardTextField.text = "\(viewModel.creditCards[row].currency) - \(viewModel.creditCards[row].cardNumber)"
        }
    }
}
