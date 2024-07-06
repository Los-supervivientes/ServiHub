//
//  LoginRepositoryProtocol.swift
//  ServiHub
//
//  Created by Jose Bueno Cruz on 6/7/24.
//

import Foundation

// MARK: - LoginRepositoryProtocol
protocol LoginRepositoryProtocol {
    func loginApp(user: String, password: String) async throws -> String
}
