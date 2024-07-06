//
//  SecureDataKeychain.swift
//  ServiHub
//
//  Created by Jose Bueno Cruz on 6/7/24.
//

import Foundation
import KeychainSwift

// MARK: - SecureDataKeychainProtocol
protocol SecureDataProtocol {
    func setToken(token: String, key: String)
    func getToken(key: String) -> String?
    func deleteToken(key: String)
}

// MARK: - SecureDataKaychain
struct SecureDataKeychain: SecureDataProtocol {
    // MARK: Properties
    private let keychain = KeychainSwift()
    
    // MARK: SetToken
    func setToken(token: String, key: String) {
        keychain.set(token, forKey: key)
    }
    
    // MARK: GetToken
    func getToken(key: String) -> String? {
        if let token = keychain.get(key) {
            return token
        } else {
            return ""
        }
    }
    
    // MARK: DeleteToken
    func deleteToken(key: String) {
        keychain.delete(key)
    }
}

// MARK: - SecureDataUserDefaults
struct SecureDataUserDefaults: SecureDataProtocol {
    // MARK: Properties
    private let userDefaults = UserDefaults.standard
    
    // MARK: SetToken
    func setToken(token: String, key: String) {
        userDefaults.setValue(token, forKey: key)
    }
    
    // MARK: GetToken
    func getToken(key: String) -> String? {
        if let token = userDefaults.value(forKey: key) as? String {
            return token
        } else {
            return ""
        }
    }
    
    // MARK: DeleteToken
    func deleteToken(key: String) {
        userDefaults.removeObject(forKey: key)
    }
}
