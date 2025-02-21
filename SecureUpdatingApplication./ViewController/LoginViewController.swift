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
    
    init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginViewModel?.delegate = self
        
        loginView.emailTextField.addTarget(self, action: #selector(emailDidChange), for: .editingChanged)
        loginView.passwordTextField.addTarget(self, action: #selector(passwordDidChange), for: .editingChanged)
        loginView.loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
    
    @objc private func emailDidChange(_ textfield: UITextField) {
        loginViewModel?.email = textfield.text ?? ""
    }
    
    @objc private func passwordDidChange(_ textfield: UITextField) {
        loginViewModel?.password = textfield.text ?? ""
    }
    
    @objc private func loginButtonPressed() {
        guard let email = loginView.emailTextField.text, let password = loginView.passwordTextField.text else { return }
        
        loginViewModel?.loginUser(email: email, password: password)
        
    }
    
//    func setupViewModel() {
//        loginViewModel = LoginViewModel(loginServiceCallProtocol: LoginServiceCall() as LoginServiceCallProtocol)
//    }
    
    
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
        print("Login successful. Login token is \(loginTokenModel.token)")
        
    }
    
    func didFailLogin(error: Error) {
        
    }
}

