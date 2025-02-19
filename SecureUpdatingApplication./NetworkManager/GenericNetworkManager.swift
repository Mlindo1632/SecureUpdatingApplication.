//
//  GenericNetworkManager.swift
//  SecureUpdatingApplication.
//
//  Created by Lindokuhle Khumalo on 2025/01/25.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
    case unknownError
}

protocol NetworkManagerProtocol {
    func request<T: Codable>(
        endpoint: String,
        method: HTTPMethod,
        parameters: [String: Any]?,
        headers: [String: String]?,
        completion: @escaping (Result<T, APIError>) -> Void
    )
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
