//
//  RegisterUseCase.swift
//  ServiHub
//
//  Created by Macbook Pro on 22/7/24.
//


import Foundation
import KeychainSwift

// MARK: - Protocol
protocol RegisterUseCaseProtocol {
    func RegisterApp(typeUser: Bool, name: String, firstSurname: String, secondSurname: String?, mobile: String, email: String
                  , password: String, street: String, city: String, state: String, postalCode: String, country: String
                  , categoryBusiness: String, companyName: String, nif: String) async throws -> String
 
}

// MARK: RegisterUseCase
final class RegisterUseCase: RegisterUseCaseProtocol {
    
    // MARK: Properties
    private let repo: RegisterRepositoryProtocol
    
    // MARK: Inits

    init(repo: RegisterRepositoryProtocol = RegisterRepository(network: NetworkRegister())){
        self.repo = repo
    }

    
    // MARK: RegisterApp
    func RegisterApp(typeUser: Bool, name: String, firstSurname: String, secondSurname: String?, mobile: String, email: String, password: String, street: String, city: String, state: String, postalCode: String, country: String, categoryBusiness: String, companyName: String, nif: String) async throws -> String {
        let data = try await repo.RegisterApp(typeUser: typeUser, name: name, firstSurname: firstSurname, secondSurname: secondSurname, mobile: mobile, email: email, password: password, street: street, city: city, state: state, postalCode: postalCode, country: country, categoryBusiness: categoryBusiness, companyName: companyName, nif: nif)
        return data
    }
          
}


// MARK: - RegisterUseCaseFake
final class RegisterUseCaseFake: RegisterUseCaseProtocol {

    
    // MARK: Properties
    private let repo: RegisterRepositoryProtocol
    
    // MARK: Inits

    init(repo: RegisterRepositoryProtocol = registerRepositoryFake(network: NetworkRegisterFake())){
        self.repo = repo
    }

    
    // MARK: RegisterApp
    func RegisterApp(typeUser: Bool, name: String, firstSurname: String, secondSurname: String?, mobile: String, email: String, password: String, street: String, city: String, state: String, postalCode: String, country: String, categoryBusiness: String, companyName: String, nif: String) async throws -> String {
        let data = try await repo.RegisterApp(typeUser: typeUser, name: name, firstSurname: firstSurname, secondSurname: secondSurname, mobile: mobile, email: email, password: password, street: street, city: city, state: state, postalCode: postalCode, country: country, categoryBusiness: categoryBusiness, companyName: companyName, nif: nif)
        return data
    }
          
}
