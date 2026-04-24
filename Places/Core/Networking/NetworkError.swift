//
//  NetworkError.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation

enum NetworkError: Error, LocalizedError, Equatable {
    case invalidURL
    case invalidResponse
    case unacceptableStatusCode(Int)
    case decodingFailed

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return  L10n.NetworkError.invalidURL
        case .invalidResponse:
            return L10n.NetworkError.invalidResponse
        case .unacceptableStatusCode:
            return L10n.NetworkError.unacceptableStatusCode
        case .decodingFailed:
            return L10n.NetworkError.decodingFailed
        }
    }
}
