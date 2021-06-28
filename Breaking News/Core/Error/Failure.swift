//
//  Failure.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 01/06/2021.
//

import Foundation

enum NetworkingErrors: Error {
    case errorParsingJSON
    case noInternetConnection
    case dataReturnedNil
    case returnedError(Error)
    case invalidStatusCode(Int)
    case customError(String)
}

extension NetworkingErrors: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .errorParsingJSON:
            return "The provided password is not valid."
        case .noInternetConnection:
            return "The specified item could not be found."
        case .dataReturnedNil:
            return "Data returned nil"
        case .returnedError(_):
            return "return error"
        case .invalidStatusCode(_):
            return "error"
        case .customError(_):
            return "Custom Error"
        }
    }
}

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
