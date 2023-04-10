//
//  LoginLaunchController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 27.03.2023.
//

import UIKit

class LoginLaunchController: BasicViewController<LoginLaunchViewModel> {
    
    // MARK: - Properties
    // MARK: Content
    
    var loginButton = UIButton()
    var registrationButton = UIButton()
    var container = UIView()
    
    // MARK: - View
    // MARK: Configure
    
    override func configureView() {
        super.configureView()
        navigationItem.title = "Welcome"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 25)!]
        view.backgroundColor = .white
        configureContainer()
        configureLoginButton()
        configureRegistrationButton()
    }
    
    
    private func configureContainer() {
        container.backgroundColor = .none
        
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        container.heightAnchor.constraint(equalToConstant: view.frame.height * 0.16).isActive = true
    }
    
    private func configureLoginButton() {
        loginButton.setTitle("Log In", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        loginButton.backgroundColor = .systemGreen
        loginButton.layer.cornerRadius = 15
        loginButton.titleLabel?.font =  loginButton.titleLabel?.font.withSize(25)
        
        container.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
    }
    
    private func configureRegistrationButton() {
        registrationButton.setTitle("Sign Up", for: .normal)
        registrationButton.addTarget(self, action: #selector(registrationTapped), for: .touchUpInside)
        registrationButton.backgroundColor = .systemGreen
        registrationButton.layer.cornerRadius = 15
        registrationButton.titleLabel?.font =  registrationButton.titleLabel?.font.withSize(25)
        
        container.addSubview(registrationButton)
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registrationButton.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        registrationButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7).isActive = true
        registrationButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
    }
    
    // MARK: - View Model
    // MARK: Configure
    
    override func configureViewModel() {
        super.configureViewModel()
    }
    
    // MARK: - Actions
    
    @objc func loginTapped() {
        viewModel.coordinateLoginPage()
    }
    @objc func registrationTapped() {
        viewModel.coordinateRegistrationPage()
    }
}
