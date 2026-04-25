//
//  NetworkEndpoint.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation

protocol NetworkEndpoint: Sendable {
    var baseURL: URL? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    
    func asURLRequest() throws -> URLRequest
}

extension NetworkEndpoint {
    func asURLRequest() throws -> URLRequest {
        guard let baseURL else {
            throw NetworkError.invalidURL
        }
        
        let url = baseURL.appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = 30
        
        return request
    }
}
