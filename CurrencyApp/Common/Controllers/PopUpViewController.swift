//
//  PopUpViewController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 04.04.2023.
//

import UIKit

class PopUpViewController: BasicViewController<PopUpViewModel> {
    //MARK: - Properties

    private var container = UIView()
    private var alertSign = UIImageView()
    private var alertLabel = UILabel()
    private var okButton = UIButton()
    
    // MARK: - Configure

    func configure() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.8)
        view.isOpaque = false
        
        container.backgroundColor = UIColor(white: 1, alpha: 0.9)
        container.layer.cornerRadius = 15
        
        alertSign.image = UIImage(systemName: "exclamationmark.triangle")
        alertSign.tintColor = .systemRed
        
        alertLabel.text = viewModel.alertLabelText
        alertLabel.numberOfLines = 6
        alertLabel.textAlignment = .center

        okButton.setTitle("Ok", for: .normal)
        okButton.addTarget(self, action: #selector(hidePopUp), for: .touchUpInside)
        okButton.backgroundColor = .systemGreen
        okButton.layer.cornerRadius = 15
    }
    
    // MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        configure()
        addConstraints()
    }
    
    // MARK: - Constraints
    
    private func addConstraints() {
        view.addSubview(container)
        container.addSubview(alertSign)
        container.addSubview(alertLabel)
        container.addSubview(okButton)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        alertSign.translatesAutoresizingMaskIntoConstraints = false
        alertLabel.translatesAutoresizingMaskIntoConstraints = false
        okButton.translatesAutoresizingMaskIntoConstraints = false
        
        container.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        container.widthAnchor.constraint(equalToConstant: view.frame.width * 0.6).isActive = true
        container.heightAnchor.constraint(equalToConstant: view.frame.height * 0.4).isActive = true
        
        alertSign.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertSign.topAnchor.constraint(equalTo: container.topAnchor, constant: 15).isActive = true
        alertSign.widthAnchor.constraint(equalToConstant: view.frame.width * 0.2).isActive = true
        alertSign.heightAnchor.constraint(equalToConstant: view.frame.width * 0.2).isActive = true
        
        alertLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        alertLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        alertLabel.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 15).isActive = true
        alertLabel.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -15).isActive = true
//        alertLabel.leftAnchor.constraint(equalToConstant: container.leftAnchor).isActive = true
//        alertLabel.heightAnchor.constraint(equalToConstant: view.frame.width * 0.3).isActive = true
        
        okButton.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        okButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -15).isActive = true
        okButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.3).isActive = true
        okButton.heightAnchor.constraint(equalToConstant: view.frame.height * 0.05).isActive = true
    }
    
    // MARK: - Action
    
    @objc func hidePopUp() {
        viewModel.closePopUpView()
    }
}
