//
//  LoginModel.swift
//  ServiHub
//
//  Created by Jose Bueno Cruz on 19/7/24.
//

import Foundation

// MARK: - Login
struct LoginModel: Decodable {
    let refreshToken: String
    let accessToken: String
    let userID: String
}
