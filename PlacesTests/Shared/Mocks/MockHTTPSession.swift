//
//  MockURLProtocol.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation
@testable import Places

final class MockHTTPSession: HTTPSession, @unchecked Sendable {

    private let result: Result<(Data, URLResponse), Error>

    init(result: Result<(Data, URLResponse), Error>) {
        self.result = result
    }

    func data(
        for request: URLRequest
    ) async throws -> (Data, URLResponse) {
        switch result {
        case .success(let value):
            return value

        case .failure(let error):
            throw error
        }
    }
}
