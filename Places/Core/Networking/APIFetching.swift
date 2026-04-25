//
//  APIFetching.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation

protocol APIFetching: Sendable {
    func fetchData<T: Decodable>(
        from endpoint: URLRequest
    ) async throws -> T
}
