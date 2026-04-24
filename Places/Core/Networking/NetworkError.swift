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
            return "Invalid URL."
        case .invalidResponse:
            return "Invalid server response."
        case .unacceptableStatusCode:
            return "Unexpected server response."
        case .decodingFailed:
            return "Failed to decode response."
        }
    }
}
