//
//  RegistrationProcessController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 27.03.2023.
//

import UIKit

final class RegistrationProcessController: BasicViewController<RegistrationProcessViewModel> {
    
    // MARK: - Properties
    // MARK: Content
    
    var nameTextField = UITextField()
    var loginTextField = UITextField()
    var passwordTextField = UITextField()
    var confirmPasswordTextField = UITextField()
    var addPictureButton = UIButton()
    var imageView = UIImageView()
    var registrationButton = UIButton()
    
    
    // MARK: - View
    // MARK: Configure
    
    override func configureView() {
        super.configureView()
        navigationItem.title = "Sign Up"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 25)!]
        navigationController?.navigationBar.tintColor = .systemGreen
        view.backgroundColor = .white
        
        configureNameTextField()
        configureLoginTextField()
        configurePasswordTextField()
        configureConfirmPasswordTextField()
        configureAddPictureButton()
        configureImageView()
        configureRegistrationButton()
    }
    
    private func configureNameTextField() {
        setProperties(for: nameTextField)
        nameTextField.placeholder = "Your name"
        nameTextField.autocorrectionType = .no
        nameTextField.returnKeyType = .next
        
        view.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height * 0.02).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
    }
    
    private func configureLoginTextField() {
        setProperties(for: loginTextField)
        loginTextField.placeholder = "yourmail@mail.com"
        loginTextField.autocorrectionType = .no
        loginTextField.keyboardType = .emailAddress
        loginTextField.autocapitalizationType = .none
        loginTextField.returnKeyType = .next
        
        view.addSubview(loginTextField)
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: view.frame.height * 0.02).isActive = true
        loginTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
    }
    
    private func configurePasswordTextField() {
        setProperties(for: passwordTextField)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Password"
        passwordTextField.autocapitalizationType = .none
        passwordTextField.returnKeyType = .next
        
        view.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: view.frame.height * 0.02).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
    }
    
    private func configureConfirmPasswordTextField() {
        setProperties(for: confirmPasswordTextField)
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.placeholder = "Confirm password"
        confirmPasswordTextField.autocapitalizationType = .none
        confirmPasswordTextField.returnKeyType = .continue
        
        view.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: view.frame.height * 0.02).isActive = true
        confirmPasswordTextField.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
    }
    
    private func configureAddPictureButton() {
        addPictureButton.setTitle("Add profile picture", for: .normal)
        addPictureButton.addTarget(self, action: #selector(addPictureTapped), for: .touchUpInside)
        addPictureButton.backgroundColor = .systemGreen
        addPictureButton.layer.cornerRadius = 15
        addPictureButton.titleLabel?.font =  addPictureButton.titleLabel?.font.withSize(25)
        
        view.addSubview(addPictureButton)
        addPictureButton.translatesAutoresizingMaskIntoConstraints = false
        addPictureButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addPictureButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: view.frame.height * 0.02).isActive = true
        addPictureButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        addPictureButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
    }
    
    private func configureImageView() {
        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .systemGray5
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: addPictureButton.bottomAnchor, constant: view.frame.height * 0.02).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.4).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: view.frame.width * 0.4).isActive = true
    }
    
    private func configureRegistrationButton() {
        registrationButton.setTitle("Sign Up", for: .normal)
        registrationButton.addTarget(self, action: #selector(registrationTapped), for: .touchUpInside)
        registrationButton.backgroundColor = .systemGreen
        registrationButton.layer.cornerRadius = 15
        registrationButton.titleLabel?.font =  registrationButton.titleLabel?.font.withSize(25)
        
        view.addSubview(registrationButton)
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registrationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -view.frame.height * 0.02).isActive = true
        registrationButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        registrationButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
    }
    
    private func setProperties(for textField: UITextField) {
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 15
        textField.font = textField.font?.withSize(20)
        textField.setPadding()
    }
    
    // MARK: - View Model
    // MARK: Configure
    
    override func configureViewModel() {
        super.configureViewModel()
    }
    
    // MARK: - Actions
    
    @objc
    private func registrationTapped() {
        let name = nameTextField.text ?? ""
        let email = loginTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        var confirmPassword = confirmPasswordTextField.text ?? ""
        let image = imageView.image?.pngData() ?? nil
        
        let user = User(name: name, email: email, profilePhoto: image)
        confirmPassword = String(confirmPassword)
        viewModel.registrationButtonClick(user: user, password: password, confirmPassword: confirmPassword)
    }
    
    @objc
    private func addPictureTapped() {
        lazy var imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
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
