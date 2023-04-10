//
//  LoginProcessController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 27.03.2023.
//

import UIKit

class LoginProcessController: BasicViewController<LoginProcessViewModel> {

    //MARK: - Properties

    var loginTextField = UITextField()
    var passwordTextField = UITextField()
    var loginButton = UIButton()
    
    // MARK: - Configure

    func configure() {
        navigationItem.title = "Log In"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 25)!]
        navigationController?.navigationBar.tintColor = .systemGreen
        view.backgroundColor = .white

        configureTextField(textField: loginTextField)
        loginTextField.placeholder = "yourmail@mail.com"
        loginTextField.autocorrectionType = .no
        loginTextField.returnKeyType = .next
        loginTextField.keyboardType = .emailAddress

        configureTextField(textField: passwordTextField)
        passwordTextField.placeholder = "Password"
        passwordTextField.autocorrectionType = .no
        passwordTextField.returnKeyType = .done
        passwordTextField.isSecureTextEntry = true

        
        loginButton.setTitle("Log In", for: .normal)
        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        loginButton.backgroundColor = .systemGreen
        loginButton.layer.cornerRadius = 15
        loginButton.titleLabel?.font =  loginButton.titleLabel?.font.withSize(25)
    }
    
    func configureTextField(textField: UITextField) {
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 15
        textField.font = textField.font?.withSize(20)
        textField.autocapitalizationType = .none
        textField.setPadding()
    }
    
    
    // MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        configure()
        addConstraints()
    }
    // MARK: - Constraints
    
    private func addConstraints() {
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height * 0.02).isActive = true
        loginTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: view.frame.height * 0.02).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -view.frame.height * 0.02).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
    }
    
    // MARK: - Action
    
    @objc func loginTapped() {
        let email = "mail@mail.com"
        let password = "qwerty"
        print("CHANGE IT LATER")
//        let email = loginTextField.text ?? ""
//        let password = passwordTextField.text ?? ""
        viewModel.loginButtonClick(email: email, password: password)
    }
}
