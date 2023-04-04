//
//  LoginLaunchController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 27.03.2023.
//

import UIKit

class LoginLaunchController: BasicViewController<LoginLaunchViewModel> {
    
    //MARK: - Properties
    
    var loginButton = UIButton()
    var registrationButton = UIButton()
    var container = UIView()
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        navigationItem.title = "Welcome"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 25)!]
        
        view.backgroundColor = .white
        loginButton.setTitle("Log In", for: .normal)
        registrationButton.setTitle("Sign Up", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        registrationButton.addTarget(self, action: #selector(registrationTapped), for: .touchUpInside)

        loginButton.backgroundColor = .systemGreen
        registrationButton.backgroundColor = .systemGreen
        container.backgroundColor = .none
        
        loginButton.layer.cornerRadius = 15
        registrationButton.layer.cornerRadius = 15
        
        loginButton.titleLabel?.font =  loginButton.titleLabel?.font.withSize(25)
        registrationButton.titleLabel?.font =  registrationButton.titleLabel?.font.withSize(25)
        
        addConstraints()
    }
    // MARK: - Constraints
    private func addConstraints() {
        view.addSubview(container)
        
        container.addSubview(loginButton)
        container.addSubview(registrationButton)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        
        container.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        container.heightAnchor.constraint(equalToConstant: view.frame.height * 0.16).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
        
        registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registrationButton.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        registrationButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7).isActive = true
        registrationButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true

    }
    
    // MARK: - Action
    
    @objc func loginTapped() {
        viewModel.coordinateLoginPage()
    }
    @objc func registrationTapped() {
        viewModel.coordinateRegistrationPage()
    }
}
