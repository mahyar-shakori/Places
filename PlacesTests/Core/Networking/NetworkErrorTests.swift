//
//  NetworkErrorTests.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Testing
@testable import Places

struct NetworkErrorTests {
    
    @Test
    func errorDescriptionsAreNonEmpty() {
        #expect(NetworkError.invalidURL.errorDescription?.isNotEmpty ?? true)
        #expect(NetworkError.invalidResponse.errorDescription?.isNotEmpty ?? true)
        #expect(NetworkError.unacceptableStatusCode(404).errorDescription?.isNotEmpty ?? true)
        #expect(NetworkError.decodingFailed.errorDescription?.isNotEmpty ?? true)
    }
    
    @Test
    func networkErrorsAreEquatable() {
        #expect(NetworkError.invalidURL == .invalidURL)
        #expect(NetworkError.invalidResponse == .invalidResponse)
        #expect(NetworkError.decodingFailed == .decodingFailed)
        #expect(NetworkError.unacceptableStatusCode(404) == .unacceptableStatusCode(404))
        #expect(NetworkError.unacceptableStatusCode(404) != .unacceptableStatusCode(500))
    }
}
