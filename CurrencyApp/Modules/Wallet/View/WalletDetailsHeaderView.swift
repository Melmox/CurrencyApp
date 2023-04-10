//
//  WalletDetailsHeaderView.swift
//  CurrencyApp
//
//  Created by developer_tmp on 10.04.2023.
//

import UIKit

final class WalletDetailsHeaderView: UIView {
    
    // MARK: - Properties
    // MARK: Content
    
    private var viewModel: WalletCollectionViewCellViewModel
    
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
    
    private lazy var conntainerEquivalentOfCollectionView = UIView(frame: CGRect(x: 20,
                                          y: 5,
                                          width: frame.width - 2 * 20,
                                          height: frame.height - 2 * 20))
    
    private lazy var conntainerEquivalentOfItem = UIView(frame: CGRect(x: 0,
                                                                       y: 0,
                                                                       width: conntainerEquivalentOfCollectionView.frame.width,
                                                                       height: conntainerEquivalentOfCollectionView.frame.width * 0.631))
    
    // MARK: - Initialization
    
    init(frame: CGRect, viewModel: WalletCollectionViewCellViewModel) {
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

        self.addSubview(conntainerEquivalentOfCollectionView)
        conntainerEquivalentOfCollectionView.addSubview(conntainerEquivalentOfItem)
        
        self.backgroundColor = .white
        addBackgroundImage()
        conntainerEquivalentOfItem.translatesAutoresizingMaskIntoConstraints = false
        
        conntainerEquivalentOfItem.addSubview(currencyLabel)
        currencyLabel.topAnchor.constraint(equalTo: conntainerEquivalentOfItem.topAnchor, constant: conntainerEquivalentOfItem.frame.height * 0.2).isActive = true
        currencyLabel.leftAnchor.constraint(equalTo: conntainerEquivalentOfItem.leftAnchor, constant: conntainerEquivalentOfItem.frame.width * 0.1).isActive = true
        
        conntainerEquivalentOfItem.addSubview(amountLabel)
        amountLabel.topAnchor.constraint(equalTo: conntainerEquivalentOfItem.topAnchor, constant: frame.height * 0.8 ).isActive = true
        amountLabel.rightAnchor.constraint(equalTo: conntainerEquivalentOfItem.leftAnchor, constant: frame.width * 0.9).isActive = true
        
        conntainerEquivalentOfItem.addSubview(cardNumberLabel)
        cardNumberLabel.topAnchor.constraint(equalTo: conntainerEquivalentOfItem.topAnchor, constant: (conntainerEquivalentOfItem.frame.height - cardNumberLabel.intrinsicContentSize.height) / 1.7).isActive = true
        cardNumberLabel.centerXAnchor.constraint(equalTo: conntainerEquivalentOfItem.centerXAnchor).isActive = true
        
        conntainerEquivalentOfItem.addSubview(cardholderNameLabel)
        cardholderNameLabel.topAnchor.constraint(equalTo: conntainerEquivalentOfItem.topAnchor, constant: frame.height * 0.8 ).isActive = true
        cardholderNameLabel.leftAnchor.constraint(equalTo: conntainerEquivalentOfItem.leftAnchor, constant: conntainerEquivalentOfItem.frame.width * 0.1).isActive = true

        conntainerEquivalentOfItem.addSubview(openDateLabel)
        openDateLabel.topAnchor.constraint(equalTo: conntainerEquivalentOfItem.topAnchor, constant: conntainerEquivalentOfItem.frame.height * 0.2).isActive = true
        openDateLabel.rightAnchor.constraint(equalTo: conntainerEquivalentOfItem.leftAnchor, constant: frame.width * 0.9).isActive = true
    }
    
    private func addBackgroundImage(){
        let imageView = UIImageView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: conntainerEquivalentOfItem.frame.width,
                                                  height: conntainerEquivalentOfItem.frame.height))
        
        let image = UIImage(named: "backgroundBankCardImage")
        imageView.image = image
        conntainerEquivalentOfItem.addSubview(imageView)
    }
    
    func configure() {
       currencyLabel.text = viewModel.currency
       cardNumberLabel.text = viewModel.cardNumber
       cardholderNameLabel.text = viewModel.cardholderName
       openDateLabel.text = viewModel.openDate
   }
}
