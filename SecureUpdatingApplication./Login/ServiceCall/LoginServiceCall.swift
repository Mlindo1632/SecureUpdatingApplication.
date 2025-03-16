//
//  LoginServiceCall.swift
//  SecureUpdatingApplication.
//
//  Created by Lindokuhle Khumalo on 2025/01/25.
//

import Foundation

protocol LoginServiceCallProtocol {
    func loginUser(email: String, password: String)
}

struct LoginServiceCall: LoginServiceCallProtocol {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
           self.networkManager = networkManager
       }
    
    func loginUser(email: String, password: String) {
        let endpoint = SecureAPIReader.readValue(key: "ReqResLoginDetails")!
        
        let parameters: [String: Any] = ["email": email, "password": password]
        
                networkManager.request(endpoint: endpoint,
                                      method: .post,
                                      parameters: parameters,
                                      headers: nil
        ) {(result: Result<LoginTokenModel, APIError>) in
            switch result {
            case .success( _):
                print("Decoding success")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

