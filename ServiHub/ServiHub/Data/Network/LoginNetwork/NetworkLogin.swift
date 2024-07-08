//
//  LoginNetwork.swift
//  ServiHub
//
//  Created by Jose Bueno Cruz on 6/7/24.
//

import Foundation

// MARK: - Protocol
protocol NetworkLoginProtocol {
    func loginApp(user: String, password: String) async throws -> String
}


// MARK: - NetworkLogin
final class NetworkLogin: NetworkLoginProtocol {
    
    // MARK: loginApp
    func loginApp(user: String, password: String) async throws -> String {
        let request = try await NetworkRequestLogin().requestForLogin(user: user, password: password)
        let (data, response) = try await URLSession.shared.data(for: request)
            
        guard let httpResponse = (response as? HTTPURLResponse),
              httpResponse.getStatusCode() == HTTPResponseCodes.SUCESS else {
            throw NetworkError.statusCodeError(response.getStatusCode())
        }
        guard let token = String(data: data, encoding: .utf8) else {
            throw NetworkError.tokenFormatError
        }
        return token
    }
}


// MARK: - NetworkLoginFake
final class NetworkLoginFake: NetworkLoginProtocol {
    func loginApp(user: String, password: String) async throws -> String {
        UUID().uuidString
    }
}
