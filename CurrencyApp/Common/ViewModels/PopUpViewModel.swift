//
//  PopUpViewModel.swift
//  CurrencyApp
//
//  Created by developer_tmp on 04.04.2023.
//

import Foundation

final class PopUpViewModel: BasicControllerViewModel {
    // MARK: - Properties
    
    var alertLabelText = ""
    var alertState: PopUpState = .success

    // MARK: Content
    
    private weak var appCoordinator: AppCoordinator?

    // MARK: - Initialization
    
    init(appCoordinator: AppCoordinator) {
        self.appCoordinator = appCoordinator
    }
    
    // MARK: - Appearance
    
    func configure() {}
    
    // MARK: - Provider
    
//    func setAlertLabelText(text: String) {
//        alertLabelText = text
//    }
//    
//    func setAlertLabelState(state: PopUpState) {
//        alertState = state
//    }
    
    // MARK: - Navigation
    
    func closePopUpView() {
        appCoordinator?.dismisPopUpController()
    }
}
