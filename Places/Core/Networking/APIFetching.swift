//
//  APIFetching.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

protocol APIFetching: Sendable {
    func fetchData<T: Decodable>(from endpoint: Endpoint) async throws -> T
}
