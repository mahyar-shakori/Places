//
//  Endpoint.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation

protocol Endpoint: Sendable {
    var url: URL? { get }
    var method: HTTPMethod { get }

    func asURLRequest() throws -> URLRequest
}

extension Endpoint {
    func asURLRequest() throws -> URLRequest {
        guard let url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = 30

        return request
    }
}
