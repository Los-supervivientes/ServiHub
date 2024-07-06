//
//  LoginUseCase.swift
//  ServiHub
//
//  Created by Jose Bueno Cruz on 6/7/24.
//

import Foundation
import KeychainSwift

// MARK: - Protocol
protocol LoginUseCaseProtocol {
    func loginApp(user: String, password: String) async throws -> Bool
    func logout() async -> Void
    func validateToken() async -> Bool
}

// MARK: LoginUseCase
final class LoginUseCase: LoginUseCaseProtocol {

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
            secureData.setToken(token: token, key: ConstantsApp.CONST_TOKEN_ID_KEYCHAIN)
            return true
        } else {
            secureData.deleteToken(key: ConstantsApp.CONST_TOKEN_ID_KEYCHAIN)
            return false
        }
    }
    
    // MARK: Logout
    func logout() async {
        secureData.deleteToken(key: ConstantsApp.CONST_TOKEN_ID_KEYCHAIN)
    }
    
    // MARK: ValidateToken
    func validateToken() async -> Bool {
        if secureData.getToken(key: ConstantsApp.CONST_TOKEN_ID_KEYCHAIN) != "" {
            return true
        } else {
            return false
        }
    }
}


// MARK: - LoginUseCaseFake
final class LoginUseCaseFake: LoginUseCaseProtocol {

    // MARK: Properties
    private let repo: LoginRepositoryProtocol
    private let secureData: SecureDataProtocol
    
    // MARK: Inits
    init(repo: LoginRepositoryProtocol = LoginRepositoryFake(),
         secureData: SecureDataProtocol = SecureDataUserDefaults()) {
        self.repo = repo
        self.secureData = secureData
    }
    
    // MARK: LoginApp
    func loginApp(user: String, password: String) async throws -> Bool {
        let token = try await repo.loginApp(user: user, password: password)
        if token != "" {
            secureData.setToken(token: token, key: ConstantsApp.CONST_TOKEN_ID_KEYCHAIN)
            return true
        } else {
            secureData.deleteToken(key: ConstantsApp.CONST_TOKEN_ID_KEYCHAIN)
            return false
        }
    }
    
    // MARK: Logout
    func logout() async {
        secureData.deleteToken(key: ConstantsApp.CONST_TOKEN_ID_KEYCHAIN)
    }
    
    // MARK: ValidateToken
    func validateToken() async -> Bool {
        return true
    }
}
