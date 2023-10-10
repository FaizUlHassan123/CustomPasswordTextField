//
//  ViewController.swift
//  CustomPasswordTextField
//
//  Created by Faiz Ul Hassan on 10/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: CustomPasswordTextField!
    @IBOutlet weak var originalPAssword: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up the custom text field
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = false // This ensures that the actual password remains hidden
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getPassword(){
        let originalPassword = passwordTextField.getOriginalPassword()
        print("originalPassword \(originalPassword)")
        originalPAssword.text = originalPassword
    }
    
    @IBAction func showPassword(){
        passwordTextField.toggleSecurePassword()
    }
    
}

