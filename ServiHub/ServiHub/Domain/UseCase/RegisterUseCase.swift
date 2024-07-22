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
    
    
    
    
    func RegisterApp(typeUser: Bool, name: String, firstSurname: String, secondSurname: String?, mobile: String, email: String, password: String, street: String, city: String, state: String, postalCode: String, country: String, categoryBusiness: String, companyName: String, nif: String) async throws -> String {
        <#code#>
    }
    

    // MARK: Properties
    private let repo: LoginRepositoryProtocol
    private let secureData: SecureDataProtocol
    
    // MARK: Inits
    init(repo: LoginRepositoryProtocol = LoginRepository(network: NetworkLogin()),
         secureData: SecureDataProtocol = SecureDataKeychain()) {
        self.repo = repo
        self.secureData = secureData
    }
    
    // MARK: LoginApp
    func loginApp(user: String, password: String) async throws -> Bool {
        let token = try await repo.loginApp(user: user, password: password)
        if token != "" {
            secureData.setToken(token: token, key: ConstantsApp.CONST_TOKEN_ACCESS_KEYCHAIN)
            return true
        } else {
            secureData.deleteToken(key: ConstantsApp.CONST_TOKEN_ACCESS_KEYCHAIN)
            return false
        }
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
