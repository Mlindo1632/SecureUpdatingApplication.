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
    func loginUser(email: String, password: String) {
        let endpoint = Bundle.main.object(forInfoDictionaryKey: "ReqresLoginDetails") as! String
        
        let parameters: [String: Any] = ["email": email, "password": password]
        
        NetworkManager.shared.request(endpoint: endpoint,
                                      method: .post,
                                      parameters: parameters,
                                      headers: nil
        ) {(result: Result<LoginTokenModel, APIError>) in
            switch result {
            case .success(let response):
                print("Post Success \(response)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

/*guard let path = Bundle.main.path(forResource: "ReqResAPIs", ofType: "plist") else {return}
let endpoint = URL(string: <#T##String#>: path)
let data = try! Data(contentsOf: endpoint)
guard let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? String else {return}*/

