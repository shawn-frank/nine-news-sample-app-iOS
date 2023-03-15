//
//  NetworkErrors.swift
//  Nine News Assessment
//
//  Created by Shawn Frank on 15/3/2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case server
    case decode
    case unknown
    case noInterne
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .serverError:
            return "Server Error"
        case .decodeError:
            return "Error parsing response"
        case .unknownError:
            return "An unknown error occured"
        }
    }
}
