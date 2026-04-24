//
//  APIService.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation

final class APIService: APIFetching {
    private let urlSession: URLSession
    private let decoder: JSONDecoder

    init(
        urlSession: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.urlSession = urlSession
        self.decoder = decoder
    }

    func fetchData<T: Decodable>(
        from endpoint: Endpoint,
        as type: T.Type
    ) async throws -> T {
        let request = try endpoint.asURLRequest()
        let (data, response) = try await urlSession.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.unacceptableStatusCode(httpResponse.statusCode)
        }
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}
