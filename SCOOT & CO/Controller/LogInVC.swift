//
//  LogInVC.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 10/24/22.
//

import UIKit
import FirebaseAuth

class LogInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLoginUpUIElements()

    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                self.displayErrorMessage("Wrong Email or Password. Please try again.")
            } else {
                self.transitionToMapVC()
            }
        }
    }
    
//    func displayErrorMessage(_ error: String) {
//        errorLabel.text = error
//        errorLabel.alpha = 1
//    }
//    func transitionToMapVC() {
//        let homeMapVC = storyboard?.instantiateViewController(withIdentifier: Constants.StoryBoard.homeMapVC) as! UINavigationController
//        homeMapVC.modalPresentationStyle = .fullScreen
//        present(homeMapVC, animated: true)
//    }
}
