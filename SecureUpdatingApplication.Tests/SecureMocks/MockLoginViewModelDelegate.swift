//
//  MockLoginViewModelDelegate.swift
//  SecureUpdatingApplication.Tests
//
//  Created by Lindokuhle Khumalo on 2025/03/13.
//

import Foundation
@testable import SecureUpdatingApplication_

class MockLoginViewModelDelegate: LoginViewModelDelegate {
    var emailValidation: (isValid: Bool, errorMessage: String?)?
    var passwordValidation: (isValid: Bool, errorMessage: String?)?
    var formValidation: Bool?
    
    func didUpdateEmailValidation(isValid: Bool, errorMessage: String?) {
        emailValidation = (isValid, errorMessage)
    }
    
    func didUpdatePasswordValidation(isValid: Bool, errorMessage: String?) {
        passwordValidation = (isValid, errorMessage)
    }
    
    func didUpdateFormValidation(isValid: Bool) {
        formValidation = isValid
    }
}
