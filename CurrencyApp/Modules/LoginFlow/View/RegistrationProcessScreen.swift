//
//  RegistrationProcessScreen.swift
//  CurrencyApp
//
//  Created by developer_tmp on 27.03.2023.
//

import UIKit

class RegistrationProcessScreen: UIViewController {
    var headerLabel = UILabel()
    var registrationButton = UIButton()
    var loginTextField = UITextField()
    var passwordTextField = UITextField()
    var confirmPasswordTextField = UITextField()
    var addPictureButton = UIButton()
    var imageView = UIImageView()
        
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        headerLabel.text = "Sign Up"
        registrationButton.setTitle("Sign Up", for: .normal)
        addPictureButton.setTitle("Add profile picture", for: .normal)
        registrationButton.addTarget(self, action: #selector(registrationTapped), for: .touchUpInside)
        addPictureButton.addTarget(self, action: #selector(addPictureTapped), for: .touchUpInside)

        loginTextField.backgroundColor = .systemGray5
        passwordTextField.backgroundColor = .systemGray5
        confirmPasswordTextField.backgroundColor = .systemGray5

        registrationButton.backgroundColor = .systemGreen
        addPictureButton.backgroundColor = .systemGreen

        
        loginTextField.layer.cornerRadius = 15
        passwordTextField.layer.cornerRadius = 15
        registrationButton.layer.cornerRadius = 15
        confirmPasswordTextField.layer.cornerRadius = 15
        addPictureButton.layer.cornerRadius = 15
        
        
        headerLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 30)
        registrationButton.titleLabel?.font =  registrationButton.titleLabel?.font.withSize(25)
        addPictureButton.titleLabel?.font =  addPictureButton.titleLabel?.font.withSize(25)
        loginTextField.font =  loginTextField.font?.withSize(20)
        passwordTextField.font =  passwordTextField.font?.withSize(20)
        confirmPasswordTextField.font =  confirmPasswordTextField.font?.withSize(20)
        
        passwordTextField.isSecureTextEntry = true
        confirmPasswordTextField.isSecureTextEntry = true
        
        loginTextField.placeholder = "Login"
        passwordTextField.placeholder = "Password"
        confirmPasswordTextField.placeholder = "Confirm password"

        
        loginTextField.setPadding()
        passwordTextField.setPadding()
        confirmPasswordTextField.setPadding()
                
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .systemGray5
        
        addConstraints()
    }
    // MARK: - Constraints
    private func addConstraints() {
        view.addSubview(headerLabel)
        view.addSubview(registrationButton)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(addPictureButton)
        view.addSubview(imageView)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        addPictureButton.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false


        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.1).isActive = true
        
        registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registrationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.width * 0.1).isActive = true
        registrationButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        registrationButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
        
        loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: view.frame.width * 0.07).isActive = true
        loginTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: view.frame.width * 0.03).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
        
        confirmPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: view.frame.width * 0.03).isActive = true
        confirmPasswordTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
        
        addPictureButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addPictureButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: view.frame.width * 0.03).isActive = true
        addPictureButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        addPictureButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: addPictureButton.bottomAnchor, constant: view.frame.width * 0.03).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.4).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: view.frame.width * 0.4).isActive = true
        
    }
    
    // MARK: - ClickHandler
    
    @objc func registrationTapped() {
        print("Registration")
    }
    @objc func addPictureTapped() {
        print("Picture added")
    }
}
