//
//  MockLoginServiceCall.swift
//  SecureUpdatingApplication.Tests
//
//  Created by Lindokuhle Khumalo on 2025/03/13.
//

import Foundation
@testable import SecureUpdatingApplication_

class MockLoginServiceCall: LoginServiceCallProtocol {
    var loginCalled = false
    var captureEmail: String?
    var capturedPassword: String?
    
    func loginUser(email: String, password: String) {
        loginCalled = true
        captureEmail = email
        capturedPassword = password
    }
}
