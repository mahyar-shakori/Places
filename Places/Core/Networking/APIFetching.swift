//
//  APIFetching.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

protocol APIFetching {
    func fetchData<T: Decodable>(
        from endpoint: Endpoint,
        as type: T.Type
    ) async throws -> T
}
