//
//  Endpoint.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation

protocol Endpoint: Sendable {
    nonisolated var url: URL? { get }
    nonisolated var method: HTTPMethod { get }

    nonisolated func asURLRequest() throws -> URLRequest
}

extension Endpoint {
    nonisolated func asURLRequest() throws -> URLRequest {
        guard let url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = 30

        return request
    }
}
