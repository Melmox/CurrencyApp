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
    var loginTextField = UITextField()
    var passwordTextField = UITextField()
    
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        headerLabel.text = "Log In"
        loginButton.setTitle("Log In", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)

        loginTextField.backgroundColor = .systemGray5
        passwordTextField.backgroundColor = .systemGray5

        loginButton.backgroundColor = .systemGreen
        
        loginTextField.layer.cornerRadius = 15
        passwordTextField.layer.cornerRadius = 15
        loginButton.layer.cornerRadius = 15
        
        headerLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 30)
        loginButton.titleLabel?.font =  loginButton.titleLabel?.font.withSize(25)
        loginTextField.font =  loginTextField.font?.withSize(20)
        passwordTextField.font =  passwordTextField.font?.withSize(20)
        
        passwordTextField.isSecureTextEntry = true
        
        loginTextField.placeholder = "Login"
        passwordTextField.placeholder = "Password"
        
//        let paddingView = UIView(frame: CGRectMake(0, 0, 15, self.loginTextField.frame.height))
//        loginTextField.leftView = paddingView
//        loginTextField.leftViewMode = UITextField.ViewMode.always
        
        loginTextField.setPadding()
        passwordTextField.setPadding()
//
        
        addConstraints()
    }
    // MARK: - Constraints
    private func addConstraints() {
        view.addSubview(headerLabel)
        view.addSubview(loginButton)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false


        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.1).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.width * 0.1).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
        
        loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: view.frame.width * 0.07).isActive = true
        loginTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: view.frame.width * 0.03).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
    }
    
    // MARK: - ClickHandler
    
    @objc func loginTapped() {
        print("Login")
    }
}
