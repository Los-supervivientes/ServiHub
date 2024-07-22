//
//  HTTPEndPoints.swift
//  ServiHub
//
//  Created by Jose Bueno Cruz on 6/7/24.
//

import Foundation

// MARK: - HTTPEndPoints
enum HTTPEndPoints: String {
    case login = "/api/auth/login"
    case categories = "/categories"
    case registerUser = "/auth/signup"
    case registerProf = "/auth/profsignup"
}
