//
//  RegistrationProcessController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 27.03.2023.
//

import UIKit

final class RegistrationProcessController: BasicViewController<RegistrationProcessViewModel> {
    
    //MARK: - Properties

    var nameTextField = UITextField()
    var loginTextField = UITextField()
    var passwordTextField = UITextField()
    var confirmPasswordTextField = UITextField()
    var addPictureButton = UIButton()
    var imageView = UIImageView()
    var registrationButton = UIButton()
    
    // MARK: - Configure
    
    func configure() {
        navigationItem.title = "Sign Up"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 25)!]
        navigationController?.navigationBar.tintColor = .systemGreen
        view.backgroundColor = .white

        configureTextField(textField: nameTextField)
        nameTextField.placeholder = "Your name"
        nameTextField.autocorrectionType = .no
        nameTextField.returnKeyType = .next
        
        configureTextField(textField: loginTextField)
        loginTextField.placeholder = "yourmail@mail.com"
        loginTextField.autocorrectionType = .no
        loginTextField.keyboardType = .emailAddress
        loginTextField.autocapitalizationType = .none
        loginTextField.returnKeyType = .next
        
        configureTextField(textField: passwordTextField)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Password"
        passwordTextField.autocapitalizationType = .none
        passwordTextField.returnKeyType = .next

        configureTextField(textField: confirmPasswordTextField)
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.placeholder = "Confirm password"
        confirmPasswordTextField.autocapitalizationType = .none
        confirmPasswordTextField.returnKeyType = .continue

        addPictureButton.setTitle("Add profile picture", for: .normal)
        addPictureButton.addTarget(self, action: #selector(addPictureTapped), for: .touchUpInside)
        addPictureButton.backgroundColor = .systemGreen
        addPictureButton.layer.cornerRadius = 15
        addPictureButton.titleLabel?.font =  addPictureButton.titleLabel?.font.withSize(25)
        
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .systemGray5
        
        registrationButton.setTitle("Sign Up", for: .normal)
        registrationButton.addTarget(self, action: #selector(registrationTapped), for: .touchUpInside)
        registrationButton.backgroundColor = .systemGreen
        registrationButton.layer.cornerRadius = 15
        registrationButton.titleLabel?.font =  registrationButton.titleLabel?.font.withSize(25)
    }
    
    func configureTextField(textField: UITextField) {
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 15
        textField.font = textField.font?.withSize(20)
        textField.setPadding()
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        configure()
        addConstraints()
    }
    
    // MARK: - Constraints
    
    private func addConstraints() {
        view.addSubview(nameTextField)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(addPictureButton)
        view.addSubview(imageView)
        view.addSubview(registrationButton)
        
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        addPictureButton.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height * 0.02).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
        
        loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: view.frame.height * 0.02).isActive = true
        loginTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: view.frame.height * 0.02).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
        
        confirmPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: view.frame.height * 0.02).isActive = true
        confirmPasswordTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
        
        addPictureButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addPictureButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: view.frame.height * 0.02).isActive = true
        addPictureButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        addPictureButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: addPictureButton.bottomAnchor, constant: view.frame.height * 0.02).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.4).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: view.frame.width * 0.4).isActive = true
        
        registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registrationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -view.frame.height * 0.02).isActive = true
        registrationButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        registrationButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
    }
    
    // MARK: - Actions
    
    @objc func registrationTapped() {
        let name = nameTextField.text ?? ""
        let email = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        var confirmPassword = confirmPasswordTextField.text ?? ""
        let image = imageView.image?.pngData() ?? nil
        
        let user = User(name: name, email: email, profilePhoto: image)
        confirmPassword = String(confirmPassword)
        viewModel.registrationButtonClick(user: user, password: password, confirmPassword: confirmPassword)
    }
    
    @objc func addPictureTapped() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true)
    }
}

extension RegistrationProcessController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageView.image = image
        }
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
