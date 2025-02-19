//
//  LoginViewController.swift
//  SecureUpdatingApplication.
//
//  Created by Lindokuhle Khumalo on 2025/02/05.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginViewModel: LoginViewModel?
    
    @IBOutlet weak var loginView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginViewModel?.delegate = self
        
        loginView.emailTextField.addTarget(self, action: #selector(emailDidChange), for: .editingDidBegin)
        loginView.passwordTextField.addTarget(self, action: #selector(passwordDidChange), for: .editingChanged)
    }
    
    @objc private func emailDidChange(_ textfield: UITextField) {
        loginViewModel?.email = textfield.text ?? ""
    }
    
    @objc private func passwordDidChange(_ textfield: UITextField) {
        loginViewModel?.password = textfield.text ?? ""
    }
    
    func setupViewModel() {
        loginViewModel = LoginViewModel(loginServiceCallProtocol: LoginServiceCall() as LoginServiceCallProtocol)
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func didUpdateEmailValidation(isValid: Bool, errorMessage: String?) {
        if let errorMessage = errorMessage {
            loginView.emailErrorLabel.text = errorMessage
            loginView.emailErrorLabel.isHidden = false
        } else {
            loginView.emailErrorLabel.isHidden = true
        }
    }
    
    func didUpdatePasswordValidation(isValid: Bool, errorMessage: String?) {
        if let errorMessage = errorMessage {
            loginView.passwordErrorLabel.text = errorMessage
            loginView.passwordErrorLabel.isHidden = false
        } else {
            loginView.passwordErrorLabel.isHidden = true
        }
    }
    
    func didUpdateFormValidation(isValid: Bool) {
        loginView.loginButton.isEnabled = isValid
    }
    
    func didSuccessfullyLogin(loginTokenModel: LoginTokenModel) {
        
    }
    
    func didFailLogin(error: Error) {
        
    }
}

