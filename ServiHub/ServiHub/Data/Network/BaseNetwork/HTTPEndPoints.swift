//
//  HTTPEndPoints.swift
//  ServiHub
//
//  Created by Jose Bueno Cruz on 6/7/24.
//

import Foundation

// MARK: - HTTPEndPoints
enum HTTPEndPoints: String {
    case login = "/auth/signin"
    case allServices = ""
    case categories = "/categories"
    case registerUser = "/auth/signup"
    case registerProf = "/auth/profsignup"
}
