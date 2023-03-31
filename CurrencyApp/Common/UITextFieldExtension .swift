//
//  UITextFieldExtension .swift
//  CurrencyApp
//
//  Created by developer_tmp on 31.03.2023.
//

import UIKit

extension UITextField {
    func setPadding() {
        let paddingView = UIView(frame: CGRectMake(0, 0, 15, self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
    }
}
