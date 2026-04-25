//
//  NetworkErrorTests.swift
//  Places
//
//  Created by Mahyar on 24/04/2026.
//

import Testing
@testable import Places

struct NetworkErrorTests {

    @Test(arguments: [
        NetworkError.invalidURL,
        NetworkError.invalidResponse,
        NetworkError.unacceptableStatusCode(404),
        NetworkError.decodingFailed
    ])
    func errorDescriptionsAreNonEmpty(error: NetworkError) {
        #expect(error.errorDescription?.isEmpty == false)
    }

    @Test(arguments: [
        NetworkError.invalidURL,
        NetworkError.invalidResponse,
        NetworkError.decodingFailed,
        NetworkError.unacceptableStatusCode(404)
    ])
    func networkErrorsAreEqualToThemselves(error: NetworkError) {
        #expect(error == error)
    }

    @Test
    func unacceptableStatusCodeIsComparedByValue() {
        #expect(NetworkError.unacceptableStatusCode(404) == .unacceptableStatusCode(404))
        #expect(NetworkError.unacceptableStatusCode(404) != .unacceptableStatusCode(500))
    }
}
