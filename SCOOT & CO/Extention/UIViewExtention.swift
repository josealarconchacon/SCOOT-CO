//
//  UIViewExtention.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 10/7/22.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var setConrnerRadius: CGFloat {
        get { return self.setConrnerRadius }
        set { self.layer.cornerRadius = newValue }
    }
}

extension MapVC {
    func setBtnLayout(_ btn: UIButton) {
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.masksToBounds = false
        btn.layer.shadowRadius = 1.0
        btn.layer.shadowOpacity = 0.5
        btn.layer.cornerRadius = btn.frame.width / 2
    }
}

extension SignUpLogInVC {
    func setButtonUI() {
        Utilities.buttonDesign(signUpButton)
        Utilities._buttons(loginButton)
    }
}

extension SignUpVC{
    func displaySignUpUIElements() {
        errorLabel.alpha = 0
        Utilities.textFieldDesign(firstNameTextField)
        Utilities.textFieldDesign(lastNameTextField)
        Utilities.textFieldDesign(emailTextField)
        Utilities.textFieldDesign(passwordTextField)
        Utilities.buttonDesign(signUpBtn)
    }
    
    func displayErrorMessage(_ error: String) {
        errorLabel.text = error
        errorLabel.alpha = 1
    }
    func transitionToMapVC() {
        let homeMapVC = storyboard?.instantiateViewController(withIdentifier: Constants.StoryBoard.homeMapVC) as! UINavigationController
        homeMapVC.modalPresentationStyle = .fullScreen
        present(homeMapVC, animated: true)
    }
}

extension LogInVC {
    func displayLoginUpUIElements() {
        errorLabel.alpha = 0
        Utilities.textFieldDesign(emailTextField)
        Utilities.textFieldDesign(passwordTextField)
        Utilities.buttonDesign(loginBtn)
    }
    func displayErrorMessage(_ error: String) {
        errorLabel.text = error
        errorLabel.alpha = 1
    }
    func transitionToMapVC() {
        let homeMapVC = storyboard?.instantiateViewController(withIdentifier: Constants.StoryBoard.homeMapVC) as! UINavigationController
        homeMapVC.modalPresentationStyle = .fullScreen
        present(homeMapVC, animated: true)
    }
}
