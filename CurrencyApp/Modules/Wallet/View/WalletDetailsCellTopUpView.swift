//
//  WalletDetailsCellTopUpView.swift
//  CurrencyApp
//
//  Created by developer_tmp on 11.04.2023.
//

import UIKit

enum SendMoneyButtonState {
    case sendMoney
    case confirm
}

final class WalletDetailsCellTopUpViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    var curentCard: CreditCard?
    var pickedCard: CreditCard?
    var creditCards: [CreditCard]?
    
    var amountMoneyToTransfer: Double?
    var exchangedValue: Double?
    var buttonState: SendMoneyButtonState = .sendMoney
    
    var informationText: String? {
            if let amountMoneyToTransfer = amountMoneyToTransfer,
               let curentCard = curentCard,
               let pickedCard = pickedCard,
               let exchangedValue = exchangedValue {
                return "You want to transfer \(amountMoneyToTransfer) \(curentCard.currency) to card \(pickedCard.cardNumber). You will get \(String(format: "%.2f", exchangedValue)) \(pickedCard.currency). From current card will be charged \(String(format: "%.2f",amountMoneyToTransfer * 1.03)) \(curentCard.currency) because of servise commission 3%."
            }
            return nil
    }
    
    // MARK: Callbacks
    
    var prepareForSendingMoney: EmptyClosure?
    var sendMoneyClicked: EmptyClosure?
    
    // MARK: - Provider
    
    func title(row: Int) -> String {
        if let currency = creditCards?[row].currency,
           let cardNumber = creditCards?[row].cardNumber{
            return "\(currency) - \(cardNumber)"
        }
        return ""
    }
    
    func setPickedCard(with card: CreditCard?){
        pickedCard = card
    }
    
    func setAmountMoneyToTransfer(with value: Double?){
        amountMoneyToTransfer = value
    }
    
    func sendMoney() {
        switch buttonState {
        case .sendMoney:
            if let _ = amountMoneyToTransfer,
               let _ = curentCard,
               let _ = pickedCard {
                if let callback = prepareForSendingMoney {
                    callback()
                }
            }
        case .confirm:
            if let callback = sendMoneyClicked {
                callback()
            }
        }
    }
}

final class WalletDetailsCellTopUpView: BasicTableCell<WalletDetailsCellTopUpViewModel>, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Properties
    // MARK: Content
    
    let identifier = String(describing: WalletDetailsCellTopUpView.self)
    
    private lazy var cardPicker = UIPickerView()
    private lazy var cardTextField = UITextField()
    private lazy var amountTextField = UITextField()
    private lazy var sendButton = UIButton()
    private lazy var infoLabel = UILabel()
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cardPicker = UIPickerView()
        cardTextField.text = nil
        amountTextField.text = nil
        sendButton.setTitle(nil, for: .normal)
        infoLabel.text = nil
    }
    
    // MARK: - Configure
    
    private func configureView() {
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        
        cardTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cardTextField)
        cardTextField.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        cardTextField.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        cardTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        cardTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(amountTextField)
        amountTextField.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        amountTextField.topAnchor.constraint(equalTo: cardTextField.bottomAnchor, constant: 10).isActive = true
        amountTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        amountTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sendButton)
        sendButton.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        sendButton.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 10).isActive = true
        sendButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(infoLabel)
        infoLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        infoLabel.topAnchor.constraint(equalTo: sendButton.bottomAnchor, constant: 10).isActive = true
        infoLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        
        
        setProperties(for: cardTextField)
        cardTextField.placeholder = "Choose card which you want to top up"
        cardTextField.inputView = cardPicker
        cardTextField.textAlignment = .center
        
        setProperties(for: amountTextField)
        amountTextField.placeholder = "Input amount of money to transfer"
        amountTextField.autocorrectionType = .no
        amountTextField.returnKeyType = .default
        amountTextField.keyboardType = .decimalPad
        amountTextField.textAlignment = .center
        
        switch viewModel?.buttonState {
        case .sendMoney:
            sendButton.setTitle("Top up selected card", for: .normal)
            cardTextField.isHidden = false
            amountTextField.isHidden = false
            infoLabel.text = nil
        case .confirm:
            sendButton.setTitle("Confirm", for: .normal)
            cardTextField.isHidden = true
            amountTextField.isHidden = true
            infoLabel.text = viewModel?.informationText
        case .none:
            sendButton.setTitle("Top up selected card", for: .normal)
            cardTextField.isHidden = false
            amountTextField.isHidden = false
            infoLabel.text = nil
        }
        sendButton.backgroundColor = .systemGreen
        sendButton.layer.cornerRadius = 15
        sendButton.titleLabel?.font =  sendButton.titleLabel?.font.withSize(20)
        sendButton.setTitleColor(.black, for: .normal)
        sendButton.addTarget(self, action: #selector(sendMoney), for: .touchUpInside)
        
        infoLabel.textAlignment = .center
        infoLabel.font = infoLabel.font.withSize(20)
        infoLabel.numberOfLines = 10
        infoLabel.lineBreakMode = .byWordWrapping
        
        cardPicker.delegate = self
        cardPicker.dataSource = self
    }
    
    private func setProperties(for textField: UITextField) {
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 15
        textField.font = textField.font?.withSize(20)
        textField.autocapitalizationType = .none
    }
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewModel
    // MARK: Configure
    
    override func configure(with viewModel: WalletDetailsCellTopUpViewModel) {
        super.configure(with: viewModel)
        configureView()
    }
    
    // MARK: - UIPickerViewDelegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let viewModel = viewModel {
            return viewModel.creditCards?.count ?? 0
        } else {return 0}
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let viewModel = viewModel {
            self.viewModel?.setPickedCard(with: viewModel.creditCards?[row])
            cardTextField.text = viewModel.title(row: row)
        }
    }
    
    // MARK: - UIPickerViewDataSource
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let viewModel = viewModel {
            return viewModel.title(row: row)
        }
        return nil
    }
    
    // MARK: - Actions
    
    @objc
    private func sendMoney() {
        switch viewModel?.buttonState {
        case .sendMoney:
            viewModel?.amountMoneyToTransfer = Double(amountTextField.text ?? "0")
            viewModel?.sendMoney()
        case .confirm:
            viewModel?.sendMoney()
        case .none:
            viewModel?.sendMoney()
        }
    }
}
