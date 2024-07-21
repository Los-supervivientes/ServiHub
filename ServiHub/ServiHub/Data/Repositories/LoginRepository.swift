//
//  LoginRepository.swift
//  ServiHub
//
//  Created by Jose Bueno Cruz on 6/7/24.
//

import Foundation

// MARK: - LoginRepository
final class LoginRepository: LoginRepositoryProtocol {
    // MARK: Properties
    private var network: NetworkLoginProtocol
    
    // MARK: Inits
    init(network: NetworkLoginProtocol) {
        self.network = network
    }
    
    // MARK: loginApp
    func loginApp(user: String, password: String) async throws -> String {
        try await NetworkHome().getAllCategories() //prueba
        return try await network.loginApp(user: user, password: password)
    }
}


//MARK: - LoginRepositoryFake
final class LoginRepositoryFake: LoginRepositoryProtocol {
    // MARK: Properties
    private var network: NetworkLoginProtocol
    
    // MARK: Inits
    init(network: NetworkLoginProtocol = NetworkLoginFake()) {
        self.network = network
    }
    
    // MARK: loginApp
    func loginApp(user: String, password: String) async throws -> String {
        return try await network.loginApp(user: user, password: password)
    }
}
