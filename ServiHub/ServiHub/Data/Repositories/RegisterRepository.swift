//
//  RegisterRepository.swift
//  ServiHub
//  Created by Diego Andrades 23/7/24.
//

import Foundation


// MARK: - RegisterRepository
final class RegisterRepository: RegisterRepositoryProtocol {

            
        // MARK: Properties
        private var network: NetworkRegisterProtocol
        
        // MARK: Inits
        init(network: NetworkRegisterProtocol) {
            self.network = network
        }
        
        // MARK: RegisterApp

        func RegisterApp(typeUser: Bool, name: String, firstSurname: String, secondSurname: String?, mobile: String, email: String, password: String, street: String, city: String, state: String, postalCode: String, country: String, categoryBusiness: String, companyName: String, nif: String) async throws -> String {
            return try await network.RegisterApp(typeUser: typeUser, name: name, firstSurname: firstSurname, secondSurname: secondSurname, mobile: mobile, email: email, password: password, street: street, city: city, state: state, postalCode: postalCode, country: country, categoryBusiness: categoryBusiness, companyName: companyName, nif: nif)
        }
    }


    //MARK: - RegisterRepositoryFake
    final class registerRepositoryFake: RegisterRepositoryProtocol {
        // MARK: Properties
        private var network: NetworkRegisterProtocol
        
        // MARK: Inits
        init(network: NetworkRegisterProtocol = NetworkRegisterFake()) {
            self.network = network
        }
        
        // MARK: loginApp
        func RegisterApp(typeUser: Bool, name: String, firstSurname: String, secondSurname: String?, mobile: String, email: String, password: String, street: String, city: String, state: String, postalCode: String, country: String, categoryBusiness: String, companyName: String, nif: String) async throws -> String {
            return try await network.RegisterApp(typeUser: typeUser, name: name, firstSurname: firstSurname, secondSurname: secondSurname, mobile: mobile, email: email, password: password, street: street, city: city, state: state, postalCode: postalCode, country: country, categoryBusiness: categoryBusiness, companyName: companyName, nif: nif)
        }
    }
