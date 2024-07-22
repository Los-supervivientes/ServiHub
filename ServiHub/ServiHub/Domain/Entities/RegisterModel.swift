//
//  RegisterModel.swift
//  ServiHub
//
//  Created by Diego Andrades on 22/7/24.
//

import Foundation


// MARK: - RegisterUserModel
struct RegisterModel{
    
    struct RegisterUserModel: Encodable {
        let name : String
        let firstSurname: String
        let secondSurname: String
        let mobile: String
        let email: String
        let password: String
        
    }
    
    
    // MARK: - RegisterProfModel
    struct RegisterProfModel: Codable {
        let name : String
        let firstSurname: String
        let secondSurname: String
        let mobile: String
        let email: String
        let password: String
        let street: String
        let city: String
        let state: String
        let postalCode: String
        let country: String
        let categoryBusiness: String
        let companyName: String
        let nif: String
    }
}
