//
//  WalletDetailsHeaderView.swift
//  CurrencyApp
//
//  Created by developer_tmp on 10.04.2023.
//

import UIKit

struct WalletDetailsHeaderViewModel {
    let creditCard: CreditCard?
    let choosenSegment: ((WalletCardDetaisTab) -> ())?
}

final class WalletDetailsHeaderView: UIView {
    
    // MARK: - Properties
    // MARK: Content
    
    private var viewModel: WalletDetailsHeaderViewModel
    
    
    private let currencyLabel: UILabel = {
        let currencyLabel = UILabel()
        currencyLabel.textColor = .white
        currencyLabel.font = currencyLabel.font.withSize(20)
        currencyLabel.textAlignment = .left
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        return currencyLabel
    }()
    
    private let amountLabel: UILabel = {
        let amountLabel = UILabel()
        amountLabel.textColor = .white
        amountLabel.font = amountLabel.font.withSize(20)
        amountLabel.textAlignment = .right
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        return amountLabel
    }()
    
    private lazy var cardNumberLabel: UILabel = {
        let cardNumberLabel = UILabel()
        cardNumberLabel.textColor = .white
        cardNumberLabel.font = cardNumberLabel.font.withSize(20)
        cardNumberLabel.textAlignment = .center
        cardNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        return cardNumberLabel
    }()
    
    private lazy var cardholderNameLabel: UILabel = {
        let cardholderNameLabel = UILabel()
        cardholderNameLabel.textColor = .white
        cardholderNameLabel.font = cardNumberLabel.font.withSize(20)
        cardholderNameLabel.textAlignment = .center
        cardholderNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return cardholderNameLabel
    }()
    
    private lazy var openDateLabel: UILabel = {
        let openDateLabel = UILabel()
        openDateLabel.textColor = .white
        openDateLabel.font = cardNumberLabel.font.withSize(20)
        openDateLabel.textAlignment = .center
        openDateLabel.translatesAutoresizingMaskIntoConstraints = false
        return openDateLabel
    }()
    
    private lazy var conntainerEquivalentOfCollectionView = UIView()
    private lazy var conntainerEquivalentOfItem = UIImageView()
    
    private lazy var segmentControl: UISegmentedControl = {
        let segmentItems = ["Transfer money", "Transaction history"]
        let segmentControl = UISegmentedControl(items: segmentItems)
        segmentControl.backgroundColor = .white
        segmentControl.selectedSegmentTintColor = .systemGreen
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        return segmentControl
    }()
    
    
    // MARK: - Initialization
    
    init(frame: CGRect, viewModel: WalletDetailsHeaderViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View
    // MARK: Configure
    
    private func setupView() {
        configure()
        
        self.addSubview(segmentControl)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        segmentControl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        segmentControl.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        
        segmentControl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        segmentControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.backgroundColor = .white
        
        self.addSubview(conntainerEquivalentOfCollectionView)
        conntainerEquivalentOfCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        conntainerEquivalentOfCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        conntainerEquivalentOfCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        conntainerEquivalentOfCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        conntainerEquivalentOfCollectionView.bottomAnchor.constraint(equalTo: segmentControl.topAnchor, constant: -10).isActive = true
        
        conntainerEquivalentOfCollectionView.addSubview(conntainerEquivalentOfItem)
        conntainerEquivalentOfItem.translatesAutoresizingMaskIntoConstraints = false
        
        conntainerEquivalentOfItem.centerXAnchor.constraint(equalTo: conntainerEquivalentOfCollectionView.centerXAnchor).isActive = true
        conntainerEquivalentOfItem.centerYAnchor.constraint(equalTo: conntainerEquivalentOfCollectionView.centerYAnchor).isActive = true
        conntainerEquivalentOfItem.widthAnchor.constraint(equalTo: conntainerEquivalentOfCollectionView.widthAnchor).isActive = true
        conntainerEquivalentOfItem.heightAnchor.constraint(equalTo: conntainerEquivalentOfCollectionView.widthAnchor, multiplier: 0.631).isActive = true
        
        addBackgroundImage(to: conntainerEquivalentOfItem)
        
        conntainerEquivalentOfItem.addSubview(currencyLabel)
        currencyLabel.topAnchor.constraint(equalToSystemSpacingBelow: conntainerEquivalentOfItem.topAnchor, multiplier: 4).isActive = true
        currencyLabel.leftAnchor.constraint(equalToSystemSpacingAfter: conntainerEquivalentOfItem.leftAnchor, multiplier: 4).isActive = true
        
        conntainerEquivalentOfItem.addSubview(amountLabel)
        amountLabel.topAnchor.constraint(equalToSystemSpacingBelow: conntainerEquivalentOfItem.topAnchor, multiplier: 22).isActive = true
        amountLabel.rightAnchor.constraint(equalToSystemSpacingAfter: conntainerEquivalentOfItem.leftAnchor, multiplier: 40).isActive = true
        
        conntainerEquivalentOfItem.addSubview(cardNumberLabel)
        cardNumberLabel.topAnchor.constraint(equalToSystemSpacingBelow: conntainerEquivalentOfItem.topAnchor, multiplier: 16).isActive = true
        cardNumberLabel.centerXAnchor.constraint(equalTo: conntainerEquivalentOfItem.centerXAnchor).isActive = true
        
        conntainerEquivalentOfItem.addSubview(cardholderNameLabel)
        cardholderNameLabel.topAnchor.constraint(equalToSystemSpacingBelow: conntainerEquivalentOfItem.topAnchor, multiplier: 22).isActive = true
        cardholderNameLabel.leftAnchor.constraint(equalToSystemSpacingAfter: conntainerEquivalentOfItem.leftAnchor, multiplier: 4).isActive = true
        
        conntainerEquivalentOfItem.addSubview(openDateLabel)
        openDateLabel.topAnchor.constraint(equalToSystemSpacingBelow: conntainerEquivalentOfItem.topAnchor, multiplier: 4).isActive = true
        openDateLabel.rightAnchor.constraint(equalToSystemSpacingAfter: conntainerEquivalentOfItem.leftAnchor, multiplier: 40).isActive = true
    }
    
    private func addBackgroundImage(to container: UIImageView){
        let image = UIImage(named: "backgroundBankCardImage")
        container.image = image
    }
    
    func configure() {
        if let balance = viewModel.creditCard?.balance {
            amountLabel.text = String(balance)
        }
        currencyLabel.text = viewModel.creditCard?.currency
        cardNumberLabel.text = viewModel.creditCard?.cardNumber
        cardholderNameLabel.text = viewModel.creditCard?.cardholderName
        openDateLabel.text = viewModel.creditCard?.openDate
        if let choosenSegment = viewModel.choosenSegment {
            choosenSegment(.topUp)
        }
    }
    
    // MARK: -  Actions
    
    @objc
    func segmentControl(_ segmentedControl: UISegmentedControl) {
        if let choosenSegment = viewModel.choosenSegment {
            switch (segmentedControl.selectedSegmentIndex) {
            case 0:
                choosenSegment(.topUp)
                break
            case 1:
                choosenSegment(.transactionHistory)
                break
            default:
                break
            }
        }
    }
}
