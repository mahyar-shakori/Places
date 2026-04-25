//
//  NetworkError.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation

enum NetworkError: Error, LocalizedError, Equatable, Sendable {
    case invalidURL
    case invalidResponse
    case unacceptableStatusCode(Int)
    case decodingFailed

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return  Localization.NetworkError.invalidURL
        case .invalidResponse:
            return Localization.NetworkError.invalidResponse
        case .unacceptableStatusCode(let code):
            return "\(Localization.NetworkError.unacceptableStatusCode) (\(code))"
        case .decodingFailed:
            return Localization.NetworkError.decodingFailed
        }
    }
}
