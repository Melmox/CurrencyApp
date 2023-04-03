//
//  RegistrationProcessScreen.swift
//  CurrencyApp
//
//  Created by developer_tmp on 27.03.2023.
//

import UIKit

class RegistrationProcessScreen: BasicViewController<RegistrationProcessViewModel>, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var registrationButton = UIButton()
    var nameTextField = UITextField()
    var loginTextField = UITextField()
    var passwordTextField = UITextField()
    var confirmPasswordTextField = UITextField()
    var addPictureButton = UIButton()
    var imageView = UIImageView()
        
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        navigationItem.title = "Sign Up"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 25)!]
        navigationController?.navigationBar.tintColor = .systemGreen
        
        view.backgroundColor = .white
        registrationButton.setTitle("Sign Up", for: .normal)
        addPictureButton.setTitle("Add profile picture", for: .normal)
        registrationButton.addTarget(self, action: #selector(registrationTapped), for: .touchUpInside)
        addPictureButton.addTarget(self, action: #selector(addPictureTapped), for: .touchUpInside)

        nameTextField.backgroundColor = .systemGray5
        loginTextField.backgroundColor = .systemGray5
        passwordTextField.backgroundColor = .systemGray5
        confirmPasswordTextField.backgroundColor = .systemGray5

        registrationButton.backgroundColor = .systemGreen
        addPictureButton.backgroundColor = .systemGreen

        nameTextField.layer.cornerRadius = 15
        loginTextField.layer.cornerRadius = 15
        passwordTextField.layer.cornerRadius = 15
        registrationButton.layer.cornerRadius = 15
        confirmPasswordTextField.layer.cornerRadius = 15
        addPictureButton.layer.cornerRadius = 15
        
        registrationButton.titleLabel?.font =  registrationButton.titleLabel?.font.withSize(25)
        addPictureButton.titleLabel?.font =  addPictureButton.titleLabel?.font.withSize(25)
        nameTextField.font = nameTextField.font?.withSize(20)
        loginTextField.font =  loginTextField.font?.withSize(20)
        passwordTextField.font =  passwordTextField.font?.withSize(20)
        confirmPasswordTextField.font =  confirmPasswordTextField.font?.withSize(20)
        
        passwordTextField.isSecureTextEntry = true
        confirmPasswordTextField.isSecureTextEntry = true
        
        nameTextField.placeholder = "Your name"
        loginTextField.placeholder = "yourmail@mail.com"
        passwordTextField.placeholder = "Password"
        confirmPasswordTextField.placeholder = "Confirm password"

        nameTextField.setPadding()
        loginTextField.setPadding()
        passwordTextField.setPadding()
        confirmPasswordTextField.setPadding()
        
        nameTextField.autocorrectionType = .no
        loginTextField.autocorrectionType = .no
        loginTextField.keyboardType = .emailAddress
        loginTextField.autocapitalizationType = .none
        
        nameTextField.returnKeyType = .next
        loginTextField.returnKeyType = .next
        passwordTextField.returnKeyType = .next
        confirmPasswordTextField.returnKeyType = .continue

        imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .systemGray5
        
        addConstraints()
    }
    // MARK: - Constraints
    private func addConstraints() {
        view.addSubview(registrationButton)
        view.addSubview(nameTextField)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(addPictureButton)
        view.addSubview(imageView)
        
        registrationButton.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        addPictureButton.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        registrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registrationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -view.frame.height * 0.02).isActive = true
        registrationButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        registrationButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.07).isActive = true
        
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
        
    }
    
    // MARK: - ClickHandler
    
    @objc func registrationTapped() {
        Firebase().createAccount(login: loginTextField.text ?? "", password: passwordTextField.text ?? "")
        viewModel.coordinateMainFlow()
        print("Registration")
    }
    @objc func addPictureTapped() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true)
    }
    
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
