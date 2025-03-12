//
//  MockNetworkManager.swift
//  SecureUpdatingApplication.Tests
//
//  Created by Lindokuhle Khumalo on 2025/03/12.
//

import Foundation
@testable import SecureUpdatingApplication_

class MockNetworkManager: NetworkManagerProtocol {
    var shouldSuccesed = true
    var capturedEndpoint: String?
    var capturedParameters: [String: Any]?
    
    func request<T>(endpoint: String,
                    method: HTTPMethod,
                    parameters: [String : Any]?,
                    headers: [String : String]?,
                    completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable, T : Encodable {
        
        capturedEndpoint = endpoint
        capturedParameters = parameters
        
        if shouldSuccesed {
            let mockToken = LoginTokenModel(token: "mockToken") as! T
            completion(.success(mockToken))
        } else {
            completion(.failure(.decodingFailed))
        }
    }
}
