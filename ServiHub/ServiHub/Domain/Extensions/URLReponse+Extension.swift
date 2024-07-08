//
//  URLReponse+Extension.swift
//  ServiHub
//
//  Created by Jose Bueno Cruz on 6/7/24.
//

import Foundation

// MARK: - URLResponseExtension
/// URLResponse extension Return the status code
extension URLResponse {
    // MARK: GetStatusCode
    func getStatusCode() -> Int {
        if let httpResponse = self as? HTTPURLResponse{
            return httpResponse.statusCode
        } else {
            return 0
        }
    }
}
