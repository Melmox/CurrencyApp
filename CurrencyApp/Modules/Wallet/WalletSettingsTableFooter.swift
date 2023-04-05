//
//  WalletSettingsTableFooter.swift
//  CurrencyApp
//
//  Created by developer_tmp on 05.04.2023.
//

import UIKit

class WalletSettingsTableFooter: UIView {
    
    // MARK: Properties
    
    private lazy var linkButton = UIButton()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(linkButton)
        linkButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        linkButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        linkButton.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        linkButton.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributeString = NSMutableAttributedString(
           string: "Terms and conditions",
           attributes: yourAttributes
        )
        linkButton.setAttributedTitle(attributeString, for: .normal)
        linkButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action
    
    @objc func buttonClicked(sender:UIButton)
    {
        let loadWebView = emptyClosure.self
    }
}
