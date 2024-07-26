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
    func logout() -> Void
    func validateToken() -> Bool
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
        if token.accessToken != "" {
            secureData.setToken(token: token.accessToken, key: ConstantsApp.CONST_TOKEN_ACCESS_KEYCHAIN)
            secureData.setToken(token: token.refreshToken, key: ConstantsApp.CONST_TOKEN_REFRESH_KEYCHAIN)
            secureData.setToken(token: token.userID, key: ConstantsApp.CONST_USER_ID_KEYCHAIN)
            return true
        } else {
            secureData.deleteToken(key: ConstantsApp.CONST_TOKEN_ACCESS_KEYCHAIN)
            secureData.deleteToken(key: ConstantsApp.CONST_TOKEN_REFRESH_KEYCHAIN)
            secureData.deleteToken(key: ConstantsApp.CONST_USER_ID_KEYCHAIN)
            return false
        }
    }
    
    // MARK: Logout
    func logout() {
        secureData.deleteToken(key: ConstantsApp.CONST_TOKEN_ACCESS_KEYCHAIN)
        secureData.deleteToken(key: ConstantsApp.CONST_TOKEN_REFRESH_KEYCHAIN)
        secureData.deleteToken(key: ConstantsApp.CONST_USER_ID_KEYCHAIN)
    }
    
    // MARK: ValidateToken
    func validateToken() -> Bool {
        if secureData.getToken(key: ConstantsApp.CONST_TOKEN_ACCESS_KEYCHAIN) != "" {
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
        
        if token.accessToken != "" {
            secureData.setToken(token: token.accessToken, key: ConstantsApp.CONST_TOKEN_ACCESS_KEYCHAIN)
            secureData.setToken(token: token.refreshToken, key: ConstantsApp.CONST_TOKEN_REFRESH_KEYCHAIN)
            secureData.setToken(token: token.userID, key: ConstantsApp.CONST_USER_ID_KEYCHAIN)
            return true
        } else {
            secureData.deleteToken(key: ConstantsApp.CONST_TOKEN_ACCESS_KEYCHAIN)
            secureData.deleteToken(key: ConstantsApp.CONST_TOKEN_REFRESH_KEYCHAIN)
            secureData.deleteToken(key: ConstantsApp.CONST_USER_ID_KEYCHAIN)
            return false
        }
    }
    
    // MARK: Logout
    func logout() {
        secureData.deleteToken(key: ConstantsApp.CONST_TOKEN_ACCESS_KEYCHAIN)
        secureData.deleteToken(key: ConstantsApp.CONST_TOKEN_REFRESH_KEYCHAIN)
        secureData.deleteToken(key: ConstantsApp.CONST_USER_ID_KEYCHAIN)
    }
    
    // MARK: ValidateToken
    func validateToken() -> Bool {
        if secureData.getToken(key: ConstantsApp.CONST_TOKEN_ACCESS_KEYCHAIN) != "" {
            return true
        } else {
            return false
        }
    }
}
