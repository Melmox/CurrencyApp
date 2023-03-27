//
//  LoginProcessScreen.swift
//  CurrencyApp
//
//  Created by developer_tmp on 27.03.2023.
//

import UIKit

class LoginProcessScreen: UIViewController {
    
    var headerLabel = UILabel()
    var loginButton = UIButton()
    var registrationButton = UIButton()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        view.backgroundColor = .purple
        headerLabel.text = "Welcome"
        loginButton.setTitle("Log In", for: .normal)
        registrationButton.setTitle("Sign Up", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        addConstraints()
    }
    // MARK: - Constraints
    private func addConstraints() {
        view.addSubview(headerLabel)
        view.addSubview(loginButton)
        view.addSubview(registrationButton)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        
        headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        
        registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registrationButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
    }
    
    // MARK: - ClickHandler
    
    @objc func loginTapped() {
        
    }
}

