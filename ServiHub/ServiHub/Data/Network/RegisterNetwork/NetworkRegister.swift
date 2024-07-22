//
//  NetworkRegister.swift
//  ServiHub
//
//  Created by Diego Andrades 22/7/24.
//

import Foundation


import Foundation

// MARK: - Protocol
protocol NetworkRegisterProtocol {
    func RegisterApp(typeUser: Bool, name: String, firstSurname: String, secondSurname: String?, mobile: String, email: String, password: String, street: String, city: String, state: String, postalCode: String, country: String, categoryBusiness: String, companyName: String, nif: String) async throws -> String
}


// MARK: - NetworkLogin
final class NetworkRegister: NetworkRegisterProtocol {
    
    // MARK: RegisterApp
    
    func RegisterApp(typeUser: Bool, name: String, firstSurname: String, secondSurname: String?, mobile: String, email: String, password: String, street: String, city: String, state: String, postalCode: String, country: String, categoryBusiness: String, companyName: String, nif: String) async throws -> String {
        
        
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
