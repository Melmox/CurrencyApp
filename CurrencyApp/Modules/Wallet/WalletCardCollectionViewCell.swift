//
//  WalletCardCollectionViewCell.swift
//  CurrencyApp
//
//  Created by developer_tmp on 14.03.2023.
//

import UIKit

final class WalletCardCollectionViewCell: BasicControllerCollectionViewCell<WalletCollectionViewCellViewModel> { //rename to
    
    //final class WalletCardCollectionViewCell: UICollectionViewCell{
    
    static let identifier = String(describing: WalletCardCollectionViewCell.self)
    //    static let identifier = "CardCollectionViewCell" // if its possible, create indentifier by using class name
    //    private lazy var creditCardNumber = getCreditCardNumber()
    
    private var testData = WalletCollectionViewCellViewModel().getItems()
    
    var isFirst : Bool = false
    var isLast : Bool = false
    
    // MARK: - Properties
    
    // MARK: Prepareation for reusing
    override func prepareForReuse() {
        amountLabel.text = nil
        cardNumberLabel.text = nil
        currencyLabel.text = nil
        isFirst = false
        isLast = false
        
        amountLabel.translatesAutoresizingMaskIntoConstraints = true
        cardNumberLabel.translatesAutoresizingMaskIntoConstraints = true
        currencyLabel.translatesAutoresizingMaskIntoConstraints = true
        leftArrow.translatesAutoresizingMaskIntoConstraints = true
        rightArrow.translatesAutoresizingMaskIntoConstraints = true
        
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        cardNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        leftArrow.translatesAutoresizingMaskIntoConstraints = false
        rightArrow.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: Views
    
    private let currencyLabel: UILabel = {
        let currencyLabel = UILabel()
        //        currencyLabel.text = "USD"
        currencyLabel.textColor = .white
        currencyLabel.font = currencyLabel.font.withSize(20)
        currencyLabel.textAlignment = .left
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        return currencyLabel
    }()
    
    private let amountLabel: UILabel = {
        let amountLabel = UILabel()
        //        amountLabel.text = "100500$"
        amountLabel.textColor = .white
        amountLabel.font = amountLabel.font.withSize(20)
        amountLabel.textAlignment = .right
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        return amountLabel
    }()
    
    private lazy var cardNumberLabel: UILabel = {
        let cardNumberLabel = UILabel()
        //        cardNumberLabel.text = testData[0]._cardNumber
        cardNumberLabel.textColor = .white
        cardNumberLabel.font = cardNumberLabel.font.withSize(20)
        cardNumberLabel.textAlignment = .center
        cardNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        return cardNumberLabel
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
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        //setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Appearance
    
    func configure(index: Int) {
        leftArrow.isHidden = isFirst
        rightArrow.isHidden = isLast
        
        for key in testData[index].currencyAndAmount.keys{
            currencyLabel.text = key.currencyName
        }
        for value in testData[index].currencyAndAmount.values{
            amountLabel.text = String(value.amountOfMoney)
        }
        cardNumberLabel.text = testData[index]._cardNumber
        
    }
    
    private func setupView() {
        
        addBackgroundImage(cell: self)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(currencyLabel)
        currencyLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.2).isActive = true
        currencyLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: self.frame.width * 0.1).isActive = true
        
        contentView.addSubview(amountLabel)
        amountLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: frame.height * 0.8 ).isActive = true
        amountLabel.rightAnchor.constraint(equalTo: self.leftAnchor, constant: frame.width * 0.9).isActive = true
        
        contentView.addSubview(cardNumberLabel)
        cardNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: (contentView.frame.height - cardNumberLabel.intrinsicContentSize.height) / 1.5).isActive = true
        cardNumberLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        contentView.addSubview(rightArrow)
        rightArrow.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        rightArrow.leftAnchor.constraint(equalTo: self.leftAnchor, constant: (0.95 * self.frame.width - rightArrow.image!.size.width)).isActive = true
        
        contentView.addSubview(leftArrow)
        leftArrow.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        leftArrow.leftAnchor.constraint(equalTo: self.leftAnchor, constant: (0.05 * self.frame.width)).isActive = true
    }
    
    private func addBackgroundImage(cell: UICollectionViewCell){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: self.frame.height))
        let image = UIImage(named: "backgroundBankCardImage")
        imageView.image = image
        cell.backgroundView = UIView()
        if cell.backgroundView != nil{
            cell.backgroundView?.addSubview(imageView)
        }
    }
}

