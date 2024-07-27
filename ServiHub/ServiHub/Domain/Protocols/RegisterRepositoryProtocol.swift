//
//  RegisterRepositoryProtocol.swift
//  ServiHub
//
//  Created by Diego Andrades on 22/7/24.
//

import Foundation

// MARK: - LoginRepositoryProtocol
protocol RegisterRepositoryProtocol {
    func RegisterApp(typeUser: Bool, name: String, firstSurname: String, secondSurname: String?, mobile: String, email: String
                  , password: String, street: String, city: String, state: String, postalCode: String, country: String
                  , categoryBusiness: String, companyName: String, nif: String) async throws -> String
}
