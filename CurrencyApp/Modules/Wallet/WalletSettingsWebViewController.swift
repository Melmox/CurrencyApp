//
//  WalletSettingsWebViewController.swift
//  CurrencyApp
//
//  Created by developer_tmp on 05.04.2023.
//

import UIKit
import WebKit

class WalletSettingsWebViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        guard let url = URL(string: "https://github.com/Melmox/CurrencyApp") else {return}
        webView.load(URLRequest(url: url))
    }
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    private func setupUI() {
            self.view.backgroundColor = .white
            self.view.addSubview(webView)
            
            NSLayoutConstraint.activate([
                webView.topAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                webView.leftAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
                webView.bottomAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                webView.rightAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
            ])
        }
}
