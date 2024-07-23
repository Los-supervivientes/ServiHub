//
//  NetworkRequestHome.swift
//  ServiHub
//
//  Created by Cristian Contreras Velásquez on 17-07-24.
//

import Foundation

// MARK: - NetworkRequestHome
struct NetworkRequestHome {
    private var secureData: SecureDataProtocol
    // MARK: Properties
    private let host = URL(string: ConstantsApp.CONST_API_URL)
    
    // MARK: Inits
    init(secureData: SecureDataProtocol = SecureDataKeychain()) {
        self.secureData = secureData
    }
    
    // MARK: Request For GetAllServices
    func requestForGetAllServices() async throws -> URLRequest {
        
        guard let url = URL(string: "\(ConstantsApp.CONST_API_URL)\(HTTPEndPoints.allServices.rawValue)") else {
            throw NetworkError.malformedURL
        }
        
        guard let token = secureData.getToken(key: ConstantsApp.CONST_TOKEN_ID_KEYCHAIN) else {
           throw NetworkError.tokenFormatError
            
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.post
        request.setValue(ConstantsApp.SSH_APIKEY, forHTTPHeaderField: HTTPHeader.sshApiKey)
        request.setValue(HTTPAuthentication.bearerToken(token),
                         forHTTPHeaderField: HTTPHeader.authorization)

        return request
    }
    
    func requestForGetAllCategories() async throws -> URLRequest {
        
        guard let url = URL(string: "\(ConstantsApp.CONST_API_URL)\(HTTPEndPoints.allServices.rawValue)") else {
            throw NetworkError.malformedURL
        }
        
        guard let token = secureData.getToken(key: ConstantsApp.CONST_TOKEN_ID_KEYCHAIN) else {
           throw NetworkError.tokenFormatError
            
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.post
        request.setValue(ConstantsApp.SSH_APIKEY, forHTTPHeaderField: HTTPHeader.sshApiKey)
        request.setValue(HTTPAuthentication.bearerToken(token),
                         forHTTPHeaderField: HTTPHeader.authorization)

        return request
    }
}
