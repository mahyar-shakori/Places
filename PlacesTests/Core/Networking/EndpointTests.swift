//
//  EndpointTests.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Foundation
import Testing
@testable import Places

struct EndpointTests {

    @Test
    func asURLRequestThrowsInvalidURLWhenEndpointURLIsNil() {
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

private struct ValidEndpoint: Endpoint {
    var url: URL? {
        URL(string: "https://example.com/test")
    }

    var method: HTTPMethod {
        .get
    }
}

private struct InvalidEndpoint: Endpoint {
    var url: URL? {
        nil
    }

    var method: HTTPMethod {
        .get
    }
}
