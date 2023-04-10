//
//  WalletSettingsHeaderViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 07.04.2023.
//

import UIKit

final class WalletSettingsHeaderViewModel {
    
    // MARK: - Properties
    // MARK: Content
    
    private var service: UserServiceable?
    private var user: User?
    private var image: UIImage?
        
    // MARK: Callbacks
    
    var didImageLoad: ((Data?) -> ())?
    
    // MARK: - Initialization
    
    init(service: UserServiceable) {
        self.service = service
        user = service.getUser()
    }
    
    // MARK: - Provider
    
    private func updateUserDownloadedPickture(with pictureData: Data?) {
        let newUser = User(name: user?.name ?? "", email: user?.email ?? "", profilePhoto: pictureData)
        service?.updateUser(with: newUser)
    }
    
    func download(url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                    self.updateUserDownloadedPickture(with: image.pngData())
                    if let didImageLoad = self.didImageLoad {
                        didImageLoad(image.pngData())
                    }
                }
            }
        }
    }
    
    func getUser() -> User? {
        user
    }
}
