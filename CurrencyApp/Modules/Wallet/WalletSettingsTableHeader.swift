//
//  WalletSettingsTableHeader.swift
//  CurrencyApp
//
//  Created by developer_tmp on 05.04.2023.
//

import UIKit

final class WalletSettingsHeader: UIView {
    
    // MARK: Properties
    
    private var profileImage = UIImageView()
    var viewModel: WalletSettingsHeaderViewModel
    
    // MARK: Initialization
        
    init(viewModel: WalletSettingsHeaderViewModel) {
        self.viewModel = viewModel
        super.init(frame: CGRect(x: 0, y: 0, width: UIView.screenWidth, height: UIView.screenHeight * 0.3))
        configure()
        showPhoto(user: viewModel.getUser())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    
    private func configure() {
        
        self.addSubview(profileImage)
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.centerXAnchor.constraint(equalTo: super.centerXAnchor).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: super.centerYAnchor).isActive = true
        profileImage.heightAnchor.constraint(equalTo: super.heightAnchor, multiplier: 0.9).isActive = true
        profileImage.widthAnchor.constraint(equalTo: super.heightAnchor, multiplier: 0.9).isActive = true
    }
    
    // MARK: - Methods
    
    func showPhoto(user: User?) {
        if user?.profilePhoto != nil {
            profileImage.image = UIImage(data: (user?.profilePhoto)!)
        } else if user?.profilePhotoURL != nil {
            viewModel.download(url: (user?.profilePhotoURL)!)
            viewModel.didImageLoad = { imageData in
                if let imageData = imageData {
                    self.profileImage.image = UIImage(data: imageData)
                }
            }
        }
    }
}
