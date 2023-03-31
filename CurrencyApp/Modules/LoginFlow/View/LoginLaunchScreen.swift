//
//  LoginLaunchScreen.swift
//  CurrencyApp
//
//  Created by developer_tmp on 27.03.2023.
//

import UIKit

class LoginLaunchScreen: UINavigationController {
    var headerLabel = UILabel()
    var loginButton = UIButton()
    var registrationButton = UIButton()
    var container = UIView()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        headerLabel.text = "Welcome"
        loginButton.setTitle("Log In", for: .normal)
        registrationButton.setTitle("Sign Up", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        registrationButton.addTarget(self, action: #selector(registrationTapped), for: .touchUpInside)

        loginButton.backgroundColor = .systemGreen
        registrationButton.backgroundColor = .systemGreen
        container.backgroundColor = .none
        
        loginButton.layer.cornerRadius = 15
        registrationButton.layer.cornerRadius = 15
        
        headerLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 30)
        loginButton.titleLabel?.font =  loginButton.titleLabel?.font.withSize(25)
        registrationButton.titleLabel?.font =  registrationButton.titleLabel?.font.withSize(25)
        
        addConstraints()
    }
    // MARK: - Constraints
    private func addConstraints() {
        view.addSubview(headerLabel)

        view.addSubview(container)
        
        container.addSubview(loginButton)
        container.addSubview(registrationButton)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        
        container.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        container.heightAnchor.constraint(equalToConstant: view.frame.height * 0.25).isActive = true
        
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.1).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: container.topAnchor, constant: 10).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
        
        registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registrationButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10).isActive = true
        registrationButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.7).isActive = true
        registrationButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true

    }
    
    // MARK: - ClickHandler
    
    @objc func loginTapped() {
        print("Login")
    }
    @objc func registrationTapped() {
        print("Registration")
    }
}
