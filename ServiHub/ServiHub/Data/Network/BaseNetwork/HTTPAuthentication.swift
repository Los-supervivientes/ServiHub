//
//  HTTPAuthentication.swift
//  ServiHub
//
//  Created by Jose Bueno Cruz on 6/7/24.
//

import Foundation

// MARK: - HTTPAuthentication
struct HTTPAuthentication {
    static func basicCredentials(_ credentials: String) -> String {
            return "Basic \(credentials)"
        }
    static func bearerToken(_ token: String) -> String {
            return "Bearer \(token)"
        }
}
