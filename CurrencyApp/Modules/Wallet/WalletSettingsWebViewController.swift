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
        let myURL = URL(string: "https://github.com/Melmox/CurrencyApp")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
//        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    func setupUI() {
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
