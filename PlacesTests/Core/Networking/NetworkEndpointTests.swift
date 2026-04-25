//
//  NetworkEndpointTests.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation
import Testing
@testable import Places

@MainActor
struct NetworkEndpointTests {

    @Test
    func asURLRequestThrowsInvalidURLWhenBaseURLIsNil() {
        let endpoint = InvalidEndpoint()

        do {
            _ = try endpoint.asURLRequest()
            Issue.record("Expected asURLRequest to throw.")
        } catch let error as NetworkError {
            #expect(error == .invalidURL)
        } catch {
            Issue.record("Expected NetworkError.invalidURL, got \(error).")
        }
    }

    @Test
    func asURLRequestCreatesRequestWithExpectedValues() throws {
        let endpoint = ValidEndpoint()

        let request = try endpoint.asURLRequest()

        #expect(request.url?.absoluteString == "https://example.com/test")
        #expect(request.httpMethod == "GET")
        #expect(request.timeoutInterval == 30)
    }
}

private struct ValidEndpoint: NetworkEndpoint {
    var baseURL: URL? {
        URL(string: "https://example.com")
    }

    var path: String {
        "test"
    }

    var method: HTTPMethod {
        .get
    }
}

private struct InvalidEndpoint: NetworkEndpoint {
    var baseURL: URL? {
        nil
    }

    var path: String {
        "test"
    }

    var method: HTTPMethod {
        .get
    }
}
