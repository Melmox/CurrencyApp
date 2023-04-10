//
//  WalletCardCollectionViewCell.swift
//  CurrencyApp
//
//  Created by developer_tmp on 14.03.2023.
//

import UIKit

final class WalletCardCollectionViewCell: BasicControllerCollectionViewCell<WalletCollectionViewCellViewModel> {
    
    // MARK: - Properties
    // MARK: Content
    
    static let identifier = String(describing: WalletCardCollectionViewCell.self)
    
    private let currencyLabel: UILabel = {
        let currencyLabel = UILabel()
        currencyLabel.textColor = .white
        currencyLabel.font = currencyLabel.font.withSize(20)
        currencyLabel.textAlignment = .left
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        return currencyLabel
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
    
    private let leftArrow: UIImageView = {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 50, weight: .bold, scale: .large)
        let leftArrow = UIImageView(image: UIImage(systemName: "chevron.compact.left", withConfiguration: largeConfig)!)
        leftArrow.translatesAutoresizingMaskIntoConstraints = false
        leftArrow.tintColor = .systemGray
        leftArrow.layer.opacity = 0.5
        return leftArrow
    }()
    
    private let rightArrow: UIImageView = {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 50, weight: .bold, scale: .large)
        let rightArrow = UIImageView(image: UIImage(systemName: "chevron.compact.right", withConfiguration: largeConfig)!)
        rightArrow.translatesAutoresizingMaskIntoConstraints = false
        rightArrow.tintColor = .systemGray
        rightArrow.layer.opacity = 0.5
        return rightArrow
    }()
    
    // MARK: Lifecycle
    
    override func prepareForReuse() {
        cardNumberLabel.text = nil
        currencyLabel.text = nil
        cardholderNameLabel.text = nil
        openDateLabel.text = nil
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View
    // MARK: Configure
    
    private func setupView() {
        
        addBackgroundImage()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(currencyLabel)
        currencyLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.2).isActive = true
        currencyLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: self.frame.width * 0.1).isActive = true

        contentView.addSubview(cardNumberLabel)
        cardNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: (contentView.frame.height - cardNumberLabel.intrinsicContentSize.height) / 1.7).isActive = true
        cardNumberLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        contentView.addSubview(cardholderNameLabel)
        cardholderNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: frame.height * 0.8 ).isActive = true
        cardholderNameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: self.frame.width * 0.1).isActive = true

        contentView.addSubview(openDateLabel)
        openDateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.2).isActive = true
        openDateLabel.rightAnchor.constraint(equalTo: self.leftAnchor, constant: frame.width * 0.9).isActive = true

        contentView.addSubview(rightArrow)
        rightArrow.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        rightArrow.leftAnchor.constraint(equalTo: self.leftAnchor, constant: (0.95 * self.frame.width - rightArrow.image!.size.width)).isActive = true
        
        contentView.addSubview(leftArrow)
        leftArrow.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        leftArrow.leftAnchor.constraint(equalTo: self.leftAnchor, constant: (0.05 * self.frame.width)).isActive = true
    }
    
    private func addBackgroundImage(){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        let image = UIImage(named: "backgroundBankCardImage")
        imageView.image = image
        self.backgroundView = UIView()
        if self.backgroundView != nil{
            self.backgroundView?.addSubview(imageView)
        }
    }
    
    // MARK: - View Model
    // MARK: Configure
    
    override func configure(with viewModel: WalletCollectionViewCellViewModel) {
        leftArrow.isHidden = viewModel.isFirst ?? true
        rightArrow.isHidden = viewModel.isLast ?? true
        currencyLabel.text = viewModel.currency
        cardNumberLabel.text = viewModel.cardNumber
        cardholderNameLabel.text = viewModel.cardholderName
        openDateLabel.text = viewModel.openDate
    }
}

