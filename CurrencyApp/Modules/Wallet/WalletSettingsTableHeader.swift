//
//  WalletSettingsTableHeader.swift
//  CurrencyApp
//
//  Created by developer_tmp on 05.04.2023.
//

import UIKit

class WalletSettingsTableHeader: UIView {
    
    // MARK: Properties
    
    private var profileImage = UIImageView()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup View
    
    func configureView(user: User) {
        if user.profilePhoto != nil {
            profileImage.image = UIImage(data: user.profilePhoto!)
        } else if user.profilePhotoURL != nil {
            profileImage.load(url: user.profilePhotoURL!)
        }
    }
    
    private func configure() {
        self.addSubview(profileImage)
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        profileImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9).isActive = true
        profileImage.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9).isActive = true
    }
}
