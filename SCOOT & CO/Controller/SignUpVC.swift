//
//  SignUpVC.swift
//  SCOOT & CO
//
//  Created by Jose Alarcon Chacon on 10/24/22.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpVC: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displaySignUpUIElements()
    }
    
    func fieldValidation() -> String? {
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "All Fields Should be Filled"
        }
        
        let securePassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.validation(securePassword) == false {
            // password is not secure
            return "Make sure your password is eight characters long and contains a special character and a number."
        }
         return nil
    }

    @IBAction func signUpButtonTapped(_ sender: Any) {
        // validate Fields
        let error = fieldValidation()
        if error != nil {
            displayErrorMessage(error!)
        } else {
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            // create user
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    self.displayErrorMessage("Error creating account")
                } else {
                    let dataBase = Firestore.firestore()
                    dataBase.collection("users").addDocument(data: ["firstname": firstName,
                                                                    "lastname": lastName,
                                                                    "uid": result!.user.uid]) { error in
                        if error != nil {
                            self.displayErrorMessage("User data could not be created")
                        }
                    }
                    // Transition to MapVC
                    self.transitionToMapVC()
                }
            }
        }
    }
}

