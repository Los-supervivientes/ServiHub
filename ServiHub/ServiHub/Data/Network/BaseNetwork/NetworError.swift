//
//  NetworError.swift
//  ServiHub
//
//  Created by Jose Bueno Cruz on 6/7/24.
//

import Foundation

// MARK: - NetworkError
enum NetworkError: Error {
    case malformedURL
    case dataEncodingFailed
    case tokenFormatError
    case statusCodeError(Int)
    case noData
    case dataDecodingFailed
}

// MARK: errorMessage
/// Returns the error in string format
func errorMessage(for error: Error) -> String {
    guard let networkError = error as? NetworkError else {
        return "UNKNOWN ERROR"
    }
    
    switch networkError {
    case .malformedURL:
        return "MALFORMED URL"
    case .dataEncodingFailed:
        return "DATA ENCODING FAILED"
    case .tokenFormatError:
        return "TOKEN FORMAT ERROR"
    case .statusCodeError(let errorCode):
        return "ERROR CODE \(errorCode)"
    case .noData:
        return "NO DATA"
    case .dataDecodingFailed:
        return "DATA DECODING FAILED"
    }
}
