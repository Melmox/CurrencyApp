//
//  PopUpViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 04.04.2023.
//

import Foundation

final class PopUpViewModel: BasicControllerViewModel {
    //MARK: - Properties
    
    var alertLabelText = ""

    //MARK: Content
    
    private weak var appCoordinator: AppCoordinator?


    
    //MARK: Callbacks
    
        
    
    //MARK: - Init
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }
    
    //MARK: - Appearance
    
    func configure() {
        
    }
    
    //MARK: - Provider
    
    func setAlertLabelText(text: String) {
        alertLabelText = text
    }
    
    //MARK: - Navigation
    
    func closePopUpView() {
        if let currentController = appCoordinator?.currentController {
            currentController.dismiss(animated: false, completion:nil)
        }
    }
}
