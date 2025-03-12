//
//  LoginServiceCallTests.swift
//  SecureUpdatingApplication.Tests
//
//  Created by Lindokuhle Khumalo on 2025/03/12.
//

import XCTest
@testable import SecureUpdatingApplication_

final class LoginServiceCallTests: XCTestCase {
    var mockNetworkManager: MockNetworkManager!
    var loginService: LoginServiceCall!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        loginService = LoginServiceCall(networkManager: mockNetworkManager)
    }
    
    func testDecodingLoginTokenModelSuccess() {
        mockNetworkManager.shouldSuccesed = true
        
        loginService.loginUser(email: "JamesFredricks@reqres.in", password: "Pass190E")
        
        XCTAssertEqual(mockNetworkManager.capturedEndpoint, SecureAPIReader.readValue(key: "ReqResLoginDetails"))
        XCTAssertEqual(mockNetworkManager.capturedParameters?["email"] as? String, "JamesFredricks@reqres.in")
        XCTAssertEqual(mockNetworkManager.capturedParameters?["password"] as? String, "Pass190E")
    }
    
    func testLoginTokenModelFailure() {
        mockNetworkManager.shouldSuccesed = false
        
        loginService.loginUser(email: "JamesFredricks@reqres.in", password: "Fail190E")
        
        XCTAssertEqual(mockNetworkManager.capturedEndpoint, SecureAPIReader.readValue(key: "ReqResLoginDetails"))
        XCTAssertEqual(mockNetworkManager.capturedParameters?["email"] as? String, "JamesFredricks@reqres.in")
        XCTAssertEqual(mockNetworkManager.capturedParameters?["password"] as? String, "Fail190E")
    }
    
    func testDecodingLoginModelFailureWhenEmailIsNotGiven() {
        mockNetworkManager.shouldSuccesed = false
        
        loginService.loginUser(email: "", password: "Pass190E")
        
        XCTAssertEqual(mockNetworkManager.capturedEndpoint, SecureAPIReader.readValue(key: "ReqResLoginDetails"))
        XCTAssertEqual(mockNetworkManager.capturedParameters?["email"] as? String, "")
        XCTAssertEqual(mockNetworkManager.capturedParameters?["password"] as? String, "Pass190E")
    }
    
    func testDecodingLoginModelFailureWhenPasswordIsNotGiven() {
        mockNetworkManager.shouldSuccesed = false
        
        loginService.loginUser(email: "Fredricks@reqres.in", password: "")
        
        XCTAssertEqual(mockNetworkManager.capturedEndpoint, SecureAPIReader.readValue(key: "ReqResLoginDetails"))
        XCTAssertEqual(mockNetworkManager.capturedParameters?["email"] as? String, "Fredricks@reqres.in")
        XCTAssertEqual(mockNetworkManager.capturedParameters?["password"] as? String, "")
    }
    
    func testDecodingLoginModelFailureWhenEmailAndPasswordAreNotGiven() {
        mockNetworkManager.shouldSuccesed = false
        
        loginService.loginUser(email: "", password: "")
        
        XCTAssertEqual(mockNetworkManager.capturedEndpoint, SecureAPIReader.readValue(key: "ReqResLoginDetails"))
        XCTAssertEqual(mockNetworkManager.capturedParameters?["email"] as? String, "")
        XCTAssertEqual(mockNetworkManager.capturedParameters?["password"] as? String, "")

    }
}
