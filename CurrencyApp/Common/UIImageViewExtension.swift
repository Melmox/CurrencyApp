//
//  UIImageViewExtension.swift
//  CurrencyApp
//
//  Created by developer_tmp on 31.03.2023.
//

import UIKit

extension UIImageView {
    func makeRounded() {
       let radius = CGRectGetWidth(self.frame) / 2
       self.layer.cornerRadius = radius
       self.layer.masksToBounds = true
    }
}
