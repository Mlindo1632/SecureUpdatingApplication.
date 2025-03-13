//
//  LoginViewModelTests.swift
//  SecureUpdatingApplication.Tests
//
//  Created by Nhlanhla Kubayi on 2025/03/13.
//

import XCTest
@testable import SecureUpdatingApplication_

final class LoginViewModelTests: XCTestCase {
    var viewModel: LoginViewModel!
    var mockServiceCall: MockLoginServiceCall!
    var mockDelegate: MockLoginViewModelDelegate!
    
    override func setUp() {
        mockServiceCall = MockLoginServiceCall()
        mockDelegate = MockLoginViewModelDelegate()
        viewModel = LoginViewModel(loginServiceCallProtocol: mockServiceCall)
        viewModel.delegate = mockDelegate
    }
    
    override func tearDown() {
        viewModel = nil
        mockServiceCall = nil
        mockDelegate = nil
        super.tearDown()
    }
    
    func testEmptyEmailShouldFailValidation() {
            viewModel.email = ""
            XCTAssertEqual(mockDelegate.emailValidation?.isValid, false)
            XCTAssertEqual(mockDelegate.emailValidation?.errorMessage, "Email cannot be empty.")
        }
    func testEmailShouldFailValidation() {
        viewModel.email = "James.Fredricks@gmail.com"
        XCTAssertEqual(mockDelegate.emailValidation?.isValid, false)
        XCTAssertEqual(mockDelegate.emailValidation?.errorMessage, "Please enter a valid email address")
    }
    
    func testEmailShouldPassValidation() {
        viewModel.email = "JamesFredricks@reqres.in"
        XCTAssertEqual(mockDelegate.emailValidation?.isValid, true)
        XCTAssertNil(mockDelegate.emailValidation?.errorMessage)
    }
    
    func testEmptyPasswordShouldFailVallidation() {
        viewModel.password = ""
        XCTAssertEqual(mockDelegate.passwordValidation?.isValid, false)
        XCTAssertEqual(mockDelegate.passwordValidation?.errorMessage, "Password cannot be empty")
    }
    
    func testPasswordShouldFailValidation() {
        viewModel.password = "1234"
        XCTAssertEqual(mockDelegate.passwordValidation?.isValid, false)
        XCTAssertEqual(mockDelegate.passwordValidation?.errorMessage, "Password needs to be atleast 6 characters.")
    }
    
    func testPasswordShouldPassValidation() {
        viewModel.password = "123456"
        XCTAssertEqual(mockDelegate.passwordValidation?.isValid, true)
        XCTAssertNil(mockDelegate.passwordValidation?.errorMessage)
    }
    
    func testInvalidFormWhenEmailIsInvalid() {
        viewModel.email = "JamesFredricks"
        viewModel.password = "123456"
        XCTAssertEqual(mockDelegate.formValidation, false)
    }
    
    func testInvalidFormWhenPasswordIsTooShort() {
        viewModel.email = "JamesFredricks@reqres.in"
        viewModel.password = "12345"
        XCTAssertEqual(mockDelegate.formValidation, false)
    }
    
    func testFormWhenEmailAndPasswordAreValid() {
        viewModel.email = "JamesFredricks@reqres.in"
        viewModel.password = "123456"
        XCTAssertEqual(mockDelegate.formValidation, true)
    }
}
