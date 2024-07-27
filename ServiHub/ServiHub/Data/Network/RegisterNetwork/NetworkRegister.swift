//
//  NetworkRegister.swift
//  ServiHub
//
//  Created by Diego Andrades 22/7/24.
//

import Foundation

// MARK: - Protocol
protocol NetworkRegisterProtocol {
    func RegisterApp(typeUser: Bool, name: String, firstSurname: String, secondSurname: String?, mobile: String, email: String, password: String, street: String, city: String, state: String, postalCode: String, country: String, categoryBusiness: String, companyName: String, nif: String) async throws -> String
}


// MARK: - NetworkRegister
final class NetworkRegister: NetworkRegisterProtocol {
    
    // MARK: RegisterApp
    
    func RegisterApp(typeUser: Bool, name: String, firstSurname: String, secondSurname: String?, mobile: String, email: String, password: String, street: String, city: String, state: String, postalCode: String, country: String, categoryBusiness: String, companyName: String, nif: String) async throws -> String {
        
        
       
        let request = try await NetworkRequestRegister().requestForRegister(typeUser: typeUser, name: name, firstSurname: firstSurname, secondSurname: secondSurname, mobile: mobile, email: email, password: password, street: street, city: city, state: state, postalCode: postalCode, country: country, categoryBusiness: categoryBusiness, companyName: companyName, nif: nif)
        
        let (data, response) = try await URLSession.shared.data(for: request)
            
        guard let httpResponse = (response as? HTTPURLResponse),
              httpResponse.getStatusCode() == HTTPResponseCodes.SUCESS else {
            throw NetworkError.statusCodeError(response.getStatusCode())
        }
        guard let recive = String(data: data, encoding: .utf8) else {
            throw NetworkError.tokenFormatError
        }
        return recive
    }
}
    


// MARK: - NetworkRegisterFake
final class NetworkRegisterFake: NetworkRegisterProtocol {
    func RegisterApp(typeUser: Bool, name: String, firstSurname: String, secondSurname: String?, mobile: String, email: String, password: String, street: String, city: String, state: String, postalCode: String, country: String, categoryBusiness: String, companyName: String, nif: String) async throws -> String {
        UUID().uuidString
    }
}
