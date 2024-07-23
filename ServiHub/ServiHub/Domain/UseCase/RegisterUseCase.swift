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


//// MARK: - LoginUseCaseFake
//final class LoginUseCaseFake: LoginUseCaseProtocol {
//
//    // MARK: Properties
//    private let repo: LoginRepositoryProtocol
//    private let secureData: SecureDataProtocol
//    
//    // MARK: Inits
//    init(repo: LoginRepositoryProtocol = LoginRepositoryFake(),
//         secureData: SecureDataProtocol = SecureDataUserDefaults()) {
//        self.repo = repo
//        self.secureData = secureData
//    }
//    
//    // MARK: LoginApp
//    func loginApp(user: String, password: String) async throws -> Bool {
//        let token = try await repo.loginApp(user: user, password: password)
//        if token != "" {
//            secureData.setToken(token: token, key: ConstantsApp.CONST_TOKEN_ACCESS_KEYCHAIN)
//            return true
//        } else {
//            secureData.deleteToken(key: ConstantsApp.CONST_TOKEN_ACCESS_KEYCHAIN)
//            return false
//        }
//    }
//    
//    // MARK: Logout
//    func logout() async {
//        secureData.deleteToken(key: ConstantsApp.CONST_TOKEN_ACCESS_KEYCHAIN)
//    }
//    
//    // MARK: ValidateToken
//    func validateToken() async -> Bool {
//        return true
//    }
//}
