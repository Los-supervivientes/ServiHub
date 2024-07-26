//
//  NetworkRequestLogin.swift
//  ServiHub
//
//  Created by Jose Bueno Cruz on 6/7/24.
//

import Foundation

// MARK: - NetworkRequestLogin
struct NetworkRequestLogin {
    // MARK: Properties
    private let host = URL(string: ConstantsApp.CONST_API_URL)
    
    // MARK: Request For Login
    func requestForLogin(user: String, password: String) async throws -> URLRequest {
        
        guard let url = URL(string: "\(ConstantsApp.CONST_API_URL)\(HTTPEndPoints.login.rawValue)") else {
            throw NetworkError.malformedURL
        }
        
        guard let encodeCredentials = "\(user):\(password)".data(using: .utf8)?.base64EncodedString() else {
            throw NetworkError.dataEncodingFailed
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get
        request.addValue(ConstantsApp.API_KEY,
                         forHTTPHeaderField: HTTPHeader.apiKey)
        request.addValue(HTTPAuthentication.basicCredentials(encodeCredentials),
                         forHTTPHeaderField: HTTPHeader.authorization)
        request.addValue(HTTPMethods.content,
                         forHTTPHeaderField: HTTPHeader.contentType)
        
        return request
    }
}
