//
//  LoginView.swift
//  SecureUpdatingApplication.
//
//  Created by Lindokuhle Khumalo on 2025/02/05.
//

import UIKit

class LoginView: UIView {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewInit()
        
        activityIndicator.isHidden = true
        emailErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        passwordTextField.isSecureTextEntry = true
        loginButton.isEnabled = false
    }
    
    func viewInit() {
        let xibView = Bundle.main.loadNibNamed("LoginView", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)
    }
}
