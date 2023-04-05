//
//  StringExtension.swift
//  CurrencyApp
//
//  Created by developer_tmp on 04.04.2023.
//

import Foundation

extension String {
    var isValidName: Bool {
        let lettersAndSpacesCharacterSet = CharacterSet.letters.union(.whitespaces).inverted
        return self.rangeOfCharacter(from: lettersAndSpacesCharacterSet) == nil
    }
    
    var isValidEmailAddress: Bool {
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = self as NSString
            let results = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
//                print("not email")
                returnValue = false
            }
            
        } catch _ as NSError {
//            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        return  returnValue
    }
}
