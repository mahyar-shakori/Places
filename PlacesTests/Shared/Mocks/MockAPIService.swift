//
//  MockAPIService.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

@testable import Places

final class MockAPIService<Response: Decodable>: APIFetching, @unchecked Sendable {
    private let result: Result<Response, NetworkError>

    init(result: Result<Response, NetworkError>) {
        self.result = result
    }

    func fetchData<T: Decodable>(
        from endpoint: NetworkEndpoint
    ) async throws -> T {
        switch result {
        case .success(let response):
            guard let typedResponse = response as? T else {
                throw NetworkError.decodingFailed
            }
            return typedResponse

        case .failure(let error):
            throw error
        }
    }
}
