//
//  Utilities.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 10/24/22.
//

import Foundation
import UIKit

class Utilities {
    static func textFieldDesign(_ textField: UITextField) {
        let setTextFieldLine = CALayer()
        setTextFieldLine.frame = CGRect(x: 0,
                                  y: textField.frame.height - 2,
                                  width: textField.frame.width, height: 0.5)
        setTextFieldLine.backgroundColor = UIColor(red: 48/255,
                                             green: 173/255,
                                             blue: 99/255,
                                             alpha: 1).cgColor
        textField.borderStyle = .none
        textField.layer.addSublayer(setTextFieldLine)
    }
    
    static func buttonDesign(_ signUpButton: UIButton) {
        signUpButton.layer.cornerRadius = 25.0
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        signUpButton.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        signUpButton.backgroundColor = UIColor(red: 235/255, green: 210/255, blue: 25/255, alpha: 1)
    }
    
    static func _buttons(_ loginButton: UIButton) {
        loginButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 25.0
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        loginButton.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }
    
    static func validation(_ password: String) -> Bool {
        let passwordValidate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordValidate.evaluate(with: password)
    }
}
